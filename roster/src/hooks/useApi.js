import { useState } from "react";
import axios from "axios";
import HOST_URL from "../lib/hostURL.js";

export default function useApi(api) {
    const [data, setData] = useState([]);

    const request = async () => {
        const response = await axios.get(`${HOST_URL}${api}`);

        setData(response.data);
        return response;
    };

    return {
        data,
        request,
    };
}
