import { data2 } from '../../../data2.js'

export default function handler(req, res) {
    const { param1 } = req.query;
    console.log('Param1: ', param1)
    res.status(200).json(data2)
}