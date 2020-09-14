import { useState } from "react";
import axios from "axios";
import HOST_URL from "../lib/hostURL.js";

export default function useRosterApi() {
    const [data, setData] = useState([]);

    const request = async () => {
        const response = await axios.get(`${HOST_URL}roster`);

        setData(response.data);
        return response;
    };

    return {
        data,
        request,
    };
}
