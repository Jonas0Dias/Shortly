import { db } from "../config/database.js";

// GET PARA /ranking
export async function visitCount(req,res){

   try{

   }
    catch(err){
        
    }
} 

"users".id,"users".name 


SELECT SUM(visitcount) as visitcountSum "tokens"."user_id", "urls"."url","urls"."shortUrl","urls"."visicount" FROM "tokens" JOIN "urls" ON "urls".token = "tokens".token
