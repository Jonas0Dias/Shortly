import { db } from "../config/database.js";
import { comparePassword } from "../utils/encryptPassword.js";
import { uuid } from "uuidv4";
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

        const token = uuid()

        const response = await db.query(`INSERT INTO "token" (user_id, token) values ($1,$2)`,[searchingEmail.rows[0].id, token])
        
        res.status(200).send(token)

    }catch(err){
        res.send(err)
    }
} 