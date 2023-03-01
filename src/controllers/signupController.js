import { db } from "../config/database.js";
import { encryptPassword } from "../utils/encryptPassword.js";

// POST PARA /signup
export async function createUser(req,res){
  
    const user = {...req.body};
    console.log(user)
    const password = encryptPassword(user.password)
    try{
        const searchingEmail = await db.query(`select * from users where email =$1`, [user.email]);

        console.log('teste')
        
        if(searchingEmail.rowCount>0){
            res.sendStatus(409);
            return;
        }

       
        await db.query(`INSERT INTO users (name, email, password, "createDate") values ($1, $2, $3, $4)`, [user.name, user.email, password, Date()]);
        res.sendStatus(201);

    }catch(err){
        res.send(err.message)
    }
} 

