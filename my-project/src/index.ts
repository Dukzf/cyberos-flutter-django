import express from 'express';
import { IndexController } from './controllers';
import { Service } from './services';

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

const indexController = new IndexController();
app.use('/api', indexController.router);

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});