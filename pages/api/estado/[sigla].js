import { data2 } from '../../../data2.js'

export default function handlerState(req, res) {
    const { query } = req;
    const text = query.sigla
    res.status(200).json(data2[text])
}