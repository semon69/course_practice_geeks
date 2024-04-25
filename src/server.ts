import express, { Application } from 'express'
import cors from 'cors'
import { UserRoutes } from './app/modules/user/user.routes'
import { CourseRoutes } from './app/modules/course/course.routes'
import { EnrollmentRoutes } from './app/modules/enrollment/enrollment.routes'

const app: Application = express()
const port = 3000

app.use(cors())
app.use(express.json());

app.get('/', (req, res) => {
    res.send({
        message: "Course practice is running"
    })
})

app.use('/api', UserRoutes)
app.use('/api', CourseRoutes)
app.use('/api', EnrollmentRoutes)

app.listen(port, ()=> {
    console.log("App is listening on port: ", port);
})
