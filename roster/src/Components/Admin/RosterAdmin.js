import React, { useState } from "react";
import DateFnsUtils from "@date-io/date-fns";
import { MDBRow, MDBCol, MDBInput } from "mdbreact"; // choose your lib
import {
  DatePicker,
  TimePicker,
  DateTimePicker,
  MuiPickersUtilsProvider,
  KeyboardDatePicker,
} from "@material-ui/pickers";
import {
  invalidEmailMsg,
  invalidMinMaxMsg,
  invalidNumber,
} from "../../lib/formValidation";

function RosterAdmin(props) {
  const [selectedDate, handleDateChange] = useState(new Date());
  return (
    <MDBRow center>
      <MDBCol sm="12" md="9" lg="7" className="grey-text">
        <form
          className="staff-new-form border border-light"
          //   onSubmit={data ? handleUpdateSubmit : handleSubmit}
        >
          <p className="h5 text-center ">Roster Admin</p>
          <div className="grey-text">
            <MDBRow center>
              <MDBCol sm="12" md="9" lg="7" className="staff-new-form">
                <MuiPickersUtilsProvider utils={DateFnsUtils}>
                  <KeyboardDatePicker
                    value={selectedDate}
                    onChange={handleDateChange}
                    format="dd/MM/yyyy"
                    size="lg"
                    label="Start Date"
                  />
                </MuiPickersUtilsProvider>
              </MDBCol>
            </MDBRow>
            <MDBRow center>
              <MDBCol sm="12" md="9" lg="7">
                <MDBInput
                  size="lg"
                  label="Roster Duration Days"
                  icon="calendar-alt"
                  group
                  type="text"
                  validate
                  error="wrong"
                  success="right"
                  required
                  name="firstname"
                  minLength="1"
                  maxLength="2"
                  //   onChange={handleFirstNameChange}
                  onInvalid={(e) => invalidNumber(e, 2, 20)}
                  onInput={(e) => invalidNumber(e, 2, 20)}
                  autoComplete="new-password"
                  //   value={firstname}
                />
              </MDBCol>
            </MDBRow>
          </div>
        </form>
      </MDBCol>
    </MDBRow>
  );
}

export default RosterAdmin;
