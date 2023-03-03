
import { db } from "../config/database.js";

// GET PARA /users/me
export async function userCount(req,res){

    const { authorization } = req.headers
    const token = authorization.replace("Bearer ", "")

    try{
        const searchingUserData = await db.query(`SELECT "tokens".*,"users".name FROM "tokens" JOIN "users" ON "users".id="tokens"."user_id" where token=$1`,[token]);
        const user_id = searchingUserData.rows[0].user_id;
        const name = searchingUserData.rows[0].name;

        const searchingVisitCount = await db.query(`SELECT SUM("visitCount") as visitcountSum from "urls" WHERE token =$1 GROUP BY token `,[token])

        const visitCount = searchingVisitCount.rows[0].visitcountsum
        console.log(visitCount)
        const searchingShortenedUrls = await db.query(`SELECT "id","shortUrl","url","visitCount" from urls`)

        res.status(200).send(

            {
                "id":user_id,
                "name":name,
                "visitCount":visitCount,
                "shortenedUrls": searchingShortenedUrls.rows
            }
        )}
        catch(err){
        res.status(500).send(err.message)
    }
} 
