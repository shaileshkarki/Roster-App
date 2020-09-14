import { useState } from "react";
import axios from "axios";
import HOST_URL from "../lib/hostURL.js";

// get all the public holidays straight away via a hook from the database.
export default function usePublicHolidaysAPI() {
    // destructure. Constant for data and method to setData
    const [data, setData] = useState([]);
    //console.log("GLEN WAS HERE - WHY DOES THIS HOOK GET CALLED 4 times???");
    const request = async () => {
        const response = await axios.get(`${HOST_URL}pubholidays`); //pubholidays
        // assign the data rows from the database to setData
        setData(response.data);

        return response;
    };

    return {
        data,
        request,
    };
}
