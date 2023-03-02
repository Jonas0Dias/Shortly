import { db } from "../config/database.js";
import { comparePassword } from "../utils/encryptPassword.js";
import { v4 as uuidv4 } from "uuid";

// POST PARA /signin
export async function Login(req,res){
    const user = {...req.body}
    try{
        const searchingEmail = await db.query('select * from users where email =$1', [user.email]);

        if(searchingEmail.rowCount === 0 ){
            res.sendStaus(404);
            return;
        }

        comparePassword(user.password, searchingEmail.rows[0].password)

        const token = uuidv4()
        console.log(token)
        const response = await db.query(`INSERT INTO "tokens" (user_id, token) values ($1,$2)`,[searchingEmail.rows[0].id, token])
        
        res.status(200).send(token)

    }catch(err){
        res.send(err)
    }
} 