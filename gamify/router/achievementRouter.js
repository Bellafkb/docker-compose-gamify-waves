const router = require("express").Router()

router.get("/:userId/progress", (req,res)=>{
    res.status(200).json({
        success: true,
        cewRanking:[]
    })
})

router.get("/", (req,res)=>{
    res.status(200).json({
        success: true,
        cewRanking:[]
    })
})

router.get("/create", (req,res)=>{
    res.status(200).json({
        success: true,
        cewRanking:[]
    })
})