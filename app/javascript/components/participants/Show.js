import React from 'react'
import BootstrapContainer from 'BootstrapContainer'

export const ParticipantInfo = ({
  about,
  name,
  zip
}) => (
  <div>
    <h1>Welcome, {name}!</h1>
    <p>You live in {zip}</p>
    <p>Here's a bit about you!</p>
    <p>{about}</p>
    <a href="profile/edit">Edit profile</a>
  </div>
)

const ShowParticipant = (props) => {
  return(
    <BootstrapContainer>
      <ParticipantInfo {...props} />
    </BootstrapContainer>
  )
}

export default ShowParticipant
