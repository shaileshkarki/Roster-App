// GJ: This modules converts unix time to human readable form based on GMT
const convertUnixTime = (unixTimeInMilliseconds) => {
    const milliseconds = unixTimeInMilliseconds * 1000;

    const dateObj = new Date(milliseconds).toUTCString();

    //console.log(dateObj);
    return dateObj;
};

export default convertUnixTime;
