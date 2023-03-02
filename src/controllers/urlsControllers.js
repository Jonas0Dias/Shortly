import { db } from "../config/database.js";
import { nanoid } from 'nanoid'
// POST PARA /urls/shorten
export async function postShortUrl(req,res){
    const { url } = req.body
    const { authorization } = req.headers
    const token = authorization.replace("Bearer ", "")
    try{
        const shortUrl = nanoid(8);
        await db.query(`
        INSERT INTO "urls" (token, url, "shortUrl") 
        VALUES ($1, $2, $3)
        `, [token, url, shortUrl])

        const urlData = await db.query(`
        SELECT * FROM urls
        WHERE url = $1
        `, [url])

        console.log(urlData)


        res.status(201).send({id: urlData.rows[0].id, shortUrl: urlData.rows[0].shortUrl})
    }catch(err){
        
        res.status(500).send(err.message);
    }
} 


// GET PARA /urls/:id
export async function getShortUrl(req,res){
    const { id } = req.params
    console.log(id)

    try{
        const searchingUrl = await db.query(`select "id","shortUrl","url" from "urls" WHERE id=$1`,[id])

        if (searchingUrl.rowCount===0) return res.sendStatus(404)
        else{
            return res.status(200).send(
                {
                    "id": searchingUrl.rows[0].id,
                    "shortUrl": searchingUrl.rows[0].shortUrl,
                    "url": searchingUrl.rows[0].url
                }
            )
        }
    }catch(err){
        res.status(500).send(err.message)
        
    }
} 


// GET PARA /urls/open/:shortUrl
export async function goToShortUrl(req,res){
    const  { shortUrl } = req.params
    try{
        const searchingShortUrl = await db.query(`SELECT * from "urls" WHERE "shortUrl" =$1`,[shortUrl])

        if(searchingShortUrl.rowCount===0) return res.send(404)
        else{
            res.redirect(302, shortUrl)
        }
    }catch(err){
        res.status(500).send(err.message)
    }
} 

// DELETE PARA /urls/:id
export async function deleteShortUrl(req,res){
    const { id } = req.params

    const { authorization } = req.headers
    const token = authorization.replace("Bearer ", "")

    try{
        const searchingUrlId = await db.query(`SELECT * from "urls" WHERE "id" =$1`,[id])

        if(searchingUrlId.rowCount === 0 ) return res.sendStatus(404);;
        if( searchingUrlId.rows[0].token !== token) return res.sendStatus(401);
        else{
            await db.query(`DELETE  from "urls" WHERE "id" =$1`,[id])
            return res.sendStatus(204)
        }

    }catch(err){
        res.status(500).send(err.message)
    }
} 





