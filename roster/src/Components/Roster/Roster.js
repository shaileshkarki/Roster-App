import React, { useState, useEffect } from "react";
import Timeline from "react-calendar-timeline";
// make sure you include the timeline stylesheet or the timeline will not be styled
import "react-calendar-timeline/lib/Timeline.css";
import useApi from "../../hooks/useApi";
import moment from "moment";

const groups = [
  { id: 1, title: "Manager", stackItems: true },
  { id: 2, title: "Supervisor", stackItems: true },
  { id: 3, title: "Chef", stackItems: true },
  { id: 4, title: "Dishwasher", stackItems: true },
  { id: 5, title: "Therapist", stackItems: true },
  { id: 6, title: "Magician", stackItems: true },
];

const createNext15MinuteTime = () => {
  let minutes15 = moment();
  minutes15 = Math.round(minutes15.minutes() / 15) * 15;
  let newStartTime = moment().minutes(minutes15);

  // console.log(newStartTime.toLocaleString());
  return newStartTime;
};

const itemStyles = {
  background: "dodgerblue",
  borderRadius: "5px",
  color: "yellow",
};

// const defaultItems = [
//   {
//     id: 1,
//     group: 1,
//     title: "Unallocated 1",
//     start_time: createNext15MinuteTime(),
//     end_time: createNext15MinuteTime().add(4.5, "hour"),
//     itemProps: {
//       style: itemStyles,
//     },
//   },
//   {
//     id: 2,
//     group: 2,
//     title: "Unallocated 2",
//     start_time: createNext15MinuteTime(),
//     end_time: createNext15MinuteTime().add(3.25, "hour"),
//     itemProps: {
//       style: itemStyles,
//     },
//   },
//   {
//     id: 3,
//     group: 1,
//     title: "Unallocated 3",
//     start_time: createNext15MinuteTime(),
//     end_time: createNext15MinuteTime().add(6, "hour"),
//     itemProps: {
//       style: itemStyles,
//     },
//   },
//   {
//     id: 4,
//     group: 1,
//     title: "Unallocated 4",
//     start_time: createNext15MinuteTime(),
//     end_time: createNext15MinuteTime().add(5.5, "hour"),
//     canMove: true,
//     canResize: true,
//     itemProps: {
//       style: itemStyles,
//     },
//   },
//   {
//     id: 5,
//     group: 2,
//     title: "Unallocated 5",
//     start_time: createNext15MinuteTime(),
//     end_time: createNext15MinuteTime().add(3, "hour"),
//     itemProps: {
//       style: itemStyles,
//     },
//   },
//   {
//     id: 6,
//     group: 1,
//     title: "Unallocated 6",
//     start_time: createNext15MinuteTime(),
//     end_time: createNext15MinuteTime().add(4, "hour"),
//     itemProps: {
//       style: itemStyles,
//     },
//   },
//   {
//     id: 7,
//     group: 1,
//     title: "Unallocated 7",
//     start_time: createNext15MinuteTime(),
//     end_time: createNext15MinuteTime().add(5.25, "hour"),
//     canMove: true,
//     canResize: true,
//     itemProps: {
//       style: itemStyles,
//     },
//   },
//   // {
//   //   id: 8,
//   //   group: 2,
//   //   title: "Unallocated 8",
//   //   start_time: createNext15MinuteTime(),
//   //   end_time: createNext15MinuteTime().add(3.25, "hour"),
//   //   itemProps: {
//   //     style: itemStyles,
//   //   },
//   // },
//   // {
//   //   id: 9,
//   //   group: 1,
//   //   title: "Unallocated 9",
//   //   start_time: createNext15MinuteTime(),
//   //   end_time: createNext15MinuteTime().add(3, "hour"),
//   //   itemProps: {
//   //     style: itemStyles,
//   //   },
//   // },
//   // {
//   //   id: 10,
//   //   group: 1,
//   //   title: "Unallocated 10",
//   //   start_time: moment.unix(createNext15MinuteTime().add(4, "hour").unix()),
//   //   end_time: moment.unix(createNext15MinuteTime().add(7, "hour").unix()),
//   //   itemProps: {
//   //     style: itemStyles,
//   //   },
//   // },
// ];
function Roster({ data }) {
  // const { data: groups, request: getAllGroups } = useApi(
  //   "http://localhost:9000/groups"
  // );

  const [items, setItems] = useState(data);

  const transformTimes = () => {
    let transformedData = [...data];
    for (let i = 0; i < data.length; i++) {
      console.log(
        "transformedData[i].start_time",
        transformedData[i].start_time
      );
      transformedData[i].start_time = moment.unix(
        transformedData[i].start_time
      );
      transformedData[i].end_time = moment.unix(transformedData[i].end_time);
      transformedData[i].id = i + 1;
    }

    console.log(2);
    // console.log("default items === ", defaultItems);
    console.log("transform items === ", transformedData);
    setItems(transformedData);
    console.log(3);
  };

  console.log("items ===", items);

  useEffect(() => {
    console.log(1);
    transformTimes();

    // getAllGroups();
  }, []);
  {
    // console.log("items ===", items);
  }
  console.log(4);
  console.log("items ===", items);
  return (
    <Timeline
      groups={groups}
      items={items}
      onItemResize={(itemId, time, edge) => {
        console.log("resize time = ", time);
        console.log("unix ", moment(time).toLocaleString());
        items.forEach((item) => {
          const oldStartTime = item.start_time;
          const oldEndTime = item.end_time;
          const duration = oldEndTime - oldStartTime;
          if (item.id === itemId) {
            if (
              moment(time).unix() >
              moment(item.start_time).add(2.75, "hour").unix()
            ) {
              item.end_time = time;
              console.log(item.title);
              console.log("duration", duration / 60 / 1000);
            } else {
              alert("Minimum shift is 3hrs");
            }
          }
        });
        setItems([...items]);
      }}
      defaultTimeStart={moment().add(-12, "hour")}
      defaultTimeEnd={moment().add(12, "hour")}
      // timeSteps={{
      //   second: 60,
      //   minute: 1,
      //   hour: 1,
      //   day: 1,
      //   month: 1,
      //   year: 1,
      // }}
      lineHeight={100}
      onItemMove={(itemId, time) => {
        items.forEach((item) => {
          const oldStartTime = item.start_time;
          const oldEndTime = item.end_time;
          const duration = oldEndTime - oldStartTime;
          if (item.id === itemId) {
            item.start_time = time;
            item.end_time = time + duration;
          }
        });
        setItems([...items]);
      }}
      onItemClick={(itemId, e, time) => {
        console.log("clicked ", itemId, e, time);
        for (let i = 0; i < items.length; i++) {
          if (items[i].id === itemId) {
            console.log("Name = ", items[i].title);
            console.log(
              "Start time = ",
              moment(items[i].start_time).toLocaleString()
            );
            console.log(
              "Finish time = ",
              moment(items[i].end_time).toLocaleString()
            );

            const duration = items[i].end_time - items[i].start_time;

            // console.log("staff id = ", items[i].staffId);

            console.log("duration = ", duration / 60 / 1000 / 60);

            // setShiftDetails({
            //   startTime: items[i].start_time,
            //   endTime: items[i].end_time,
            //   name: items[i].title,
            //   e: e,
            // });
            return;
          }
        }
      }}
    />
  );
}

export default Roster;
