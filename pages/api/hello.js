import { data2 } from '../../data2.ts'

export default function handler(req, res) {
    res.status(200).json(data2)
}