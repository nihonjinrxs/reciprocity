import React from 'react'
import PropTypes from 'prop-types'
import BootstrapContainer from 'BootstrapContainer'
import Form from '../../shared/Form'
import Checkbox from '../../shared/FormCheckbox'

const ParticipantInterestForm = ({
  interest_list,
  form,
}) => {
  return(
    <BootstrapContainer>
      <div className="row">
        <Form {...form}>
          <fieldset>
            <legend>Interests and Focus</legend>
            <p>Check all that apply to your interests and the kinds of things you might want to come across in your time exploring Reciprocity.Love</p>
            {interest_list.map(function(interest, i) {
              return <Checkbox
                key={i}
                label={interest}
                name="interest_list[]"
                value={interest}
              />
            })}
          </fieldset>
          <button type="submit" className="btn btn-primary">Submit</button>
        </Form>
      </div>
    </BootstrapContainer>
  )
}

ParticipantInterestForm.propTypes = {
  interest_list: PropTypes.array.isRequired,
}

export default ParticipantInterestForm

