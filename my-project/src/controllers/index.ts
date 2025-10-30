export class IndexController {
    public getIndex(req, res) {
        res.send('Welcome to the Index Route');
    }

    public getAbout(req, res) {
        res.send('About this application');
    }

    public getContact(req, res) {
        res.send('Contact us at contact@example.com');
    }
}