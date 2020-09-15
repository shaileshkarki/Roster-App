import React from "react";

import { MDBIcon, MDBTypography } from "mdbreact";

function Profile({ profile }) {
  return (
    <div className="col-sm profile-hover">
      <div className="cnt-block equal-hight">
        <figure>
          <img src={`${profile.avatar}`} className="img-responsive" alt="" />
        </figure>
        <h3>
          <a href={profile.portfolio} target="_blank" rel="noopener noreferrer">
            {profile.name}
          </a>
        </h3>
        <p>{profile.title}</p>
        <div>
          <div>
            <a
              href={profile.linkedin}
              target="_blank"
              rel="noopener noreferrer"
            >
              <MDBIcon fab icon="linkedin" />
            </a>
          </div>
          <div>
            <a href={profile.github} target="_blank" rel="noopener noreferrer">
              <MDBIcon fab icon="github" />
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}
function ContactUs(props) {
  const profiles = [
    {
      name: "Glen Jones",
      title: "Software Engineer",
      portfolio: "https://www.glenjones.com.au/",
      avatar: "../images/Glen-Avatar.png",
      linkedin: "https://www.linkedin.com/in/mrglenjones/",
      github: "https://github.com/mistergjones",
    },
    {
      name: "Peter Hristakos",
      title: "Software Engineer",
      portfolio: "http://peter-hristakos.surge.sh/",
      avatar: "../images/Peter.png",
      linkedin: "https://www.linkedin.com/in/peter-hristakos/",
      github: "https://github.com/Hristakos",
    },
    {
      name: "Shailesh Karki",
      title: "Software Engineer",
      portfolio: "http://shaileshkarki.surge.sh/",
      avatar: "../images/Shailesh.png",
      linkedin: "https://www.linkedin.com/in/shaileshkarki/",
      github: "https://github.com/shaileshkarki",
    },
  ];
  return (
    <div>
      <MDBTypography tag="h2" variant="h2-responsive">
        Contact Us
      </MDBTypography>
      <center>
        <div className="borderForm">
          <MDBTypography
            note
            noteColor="info"
            noteTitle="We'd love to hear from you"
          >
            <p>
              If you have a question about features or working of this website,
              or would to like see other projects done by us, please click on
              links below to our personal Github pages.
            </p>
          </MDBTypography>
        </div>
      </center>
      <section className="our-team padding-lg">
        <div className="container">
          <div className="row">
            {profiles.map((profile, index) => (
              <Profile key={index} profile={profile} />
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}

export default ContactUs;
