import { db } from "../config/database.js";

// GET PARA /ranking
export async function visitCount(req,res){

   try{
    const ranking = await db.query(`SELECT "users"."id" as "user_id","users"."name" as "username", COUNT(*) as "linksCount" ,SUM("urls"."visitCount") as "visitCount" from tokens  JOIN users ON "tokens"."user_id"="users"."id" JOIN "urls"ON "urls"."token" = "tokens".token GROUP BY "users"."id" ORDER BY "linksCount" ASC LIMIT 10`)						
    res.status(200).send(ranking.rows)
   }
    catch(err){
        res.status(500).send(err.message)
    }
} 



