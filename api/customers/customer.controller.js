const {
    create,
    list
} = require("./customer.service");

module.exports = {
    createCustomer: (req, res) => {
        const name = req.query.name;
        const email = req.query.email;
        const telephone = req.query.telephone;
        const body = {
            name,
            email,
            telephone
        };
        create(body, (err, results) => {
            if (err) {
                return res.status(500).json({
                success: 0,
                message: "Database connection errror"
                });
            }
            return res.status(200).json({
                success: 1,
                data: results
            });
        });
    },
    listCustomers: (req, res) => {
        list((err, results) => {
            if (err) {
                return res.status(500).json({
                success: 0,
                message: "Database connection errror"
                });
            }
            return res.status(200).json({
                success: 1,
                data: results
            });
        });
    }
};