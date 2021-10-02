/**
 * This controller acts as the controller for requests coming into /api/tag endpoints.
 * @module api/tags/tag-controller
 *
 */
const {
    create,
    createValue,
    getLastTagValueById,
    listByCustomer,
    listBySystem,
    createMultipleTags
} = require("./tag.service");

/**
 * This function works as the request controller for Tag generation.
 * Requests for /api/tag/create are recieved for this method.
 * 
 * @param {Object} req Request coming from the client to the server.
 * @param {Object} res Response generated from server to the client.
 * @returns {Object} res Response to the client.
 * - res.success - Whether the operation is success or nor.
 * - res.data - Data of the saved tag, if the operation is success.
 * - res.message - Error message, if the operation is failed.
 */
const createTag = (req, res) => {
    const systemId = req.query.systemId;
    const name = req.query.name;
    const description = req.query.description;
    const currentTime = new Date();
    const timestamp = currentTime.getTime();
    const data = {
        systemId,
        name,
        description,
        currentTime,
    };
    create(data, (err, results) => {
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

const createMultipleTag = (req, res) => {
    const systemId = req.query.systemId;
    const data = {
        systemId
    };
    createMultipleTags(data, (err, results) => {
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

/**
 * This function works as the request controller for Tag value generation.
 * Requests for /api/tag/create/value are recieved for this method.
 * 
 * @param {Object} req Request coming from the client to the server.
 * @param {Object} res Response generated from server to the client.
 * @returns {Object} res Response to the client.
 * - res.success - Whether the operation is success or nor.
 * - res.data - Data of the saved tag value, if the operation is success.
 * - res.message - Error message, if the operation is failed.
 */
const createTagValue = (req, res) => {
    const ids = req.query.tagIds.split(',');
    const values = req.query.values.split(',');
    const data = {
        ids,
        values,
    };
    createValue(data, (err, results) => {
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

/**
 * This function works as the request controller for fetching last value of a given tag.
 * Requests for /api/tag/get/value are recieved for this method.
 * 
 * @param {Object} req Request coming from the client to the server.
 * @param {Object} res Response generated from server to the client.
 * @returns {Object} res Response to the client.
 * - res.success - Whether the operation is success or nor.
 * - res.data - Data of the last tag value, if the operation is success.
 * - res.message - Error message, if the operation is failed.
 */
const getLastTagValue = (req, res) => {
    const tagId = req.query.tagId;
    const value = req.query.value;
    const currentTime = new Date();
    const data = {
        tagId,
        value,
        currentTime,
    };
    getLastTagValueById(data, (err, results) => {
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

/**
 * This function works as the request controller for listing Tags by Customer.
 * API Key is extracted from the header and it is used as an identifier.
 * Requests for /api/tag/list/by-customer are recieved for this method.
 * 
 * @param {Object} req Request coming from the client to the server.
 * @param {Object} res Response generated from server to the client.
 * @returns {Object} res Response to the client.
 * - res.success - Whether the operation is success or nor.
 * - res.data - Data of the customer's tags, if the operation is success.
 * - res.message - Error message, if the operation is failed.
 */

const listTagsByCustomer = (req, res) => {
    console.log("res");
    const apiKey =req.header('x-api-key');
    const data = {
        apiKey,
    };
    listBySystem((err, results) => {
        if (err) {
            return res.status(500).json({
            success: 0,
            message: "Database connection errror"
            });
        }
        let finalizedData = []
        for(i = 0; i < results.length; i++) {
            const reqSystemData = results.filter(result => result.id == results[i].id);
            console.log(reqSystemData.length)
            const reqTagNames = reqSystemData.filter(sys => { return sys.name});
            const reqTagValues = reqSystemData.filter(sys => { return sys.value});
            let finalData = {}
            reqTagNames.forEach((name, m) => {
                if(reqTagValues[m]) {
                    finalData[name.name] = reqTagValues[m].value;
                } else {
                    finalData[name.name] = null;
                }
            })
            finalizedData.push(finalData);
            i = i + reqSystemData.length;
        }
        // console.log(finalizedData);
        return res.status(200).json({
            success: 1,
            data: finalizedData
        });
    });
}

module.exports = {
    createTag,
    createTagValue,
    getLastTagValue,
    listTagsByCustomer,
    createMultipleTag
};