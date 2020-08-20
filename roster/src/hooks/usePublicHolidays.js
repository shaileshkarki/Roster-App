import { useState } from "react";
import axios from "axios";

// get all the public holidays straight away via a hook
export default function usePublicHolidays() {
    const [data, setData] = useState([]);

    const request = async () => {
        const response = await axios.get(
            "http://localhost:9000/publicholidays"
        );

        setData(response.data);
        return response;
    };

    return {
        data,
        request,
    };
}
