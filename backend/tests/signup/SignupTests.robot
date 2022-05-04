* Settings *
Documentation    Signup Tests

Resource    ${EXECDIR}/resources/Base.robot

* Test Cases *
Add New User

    ${payload}              Get Json               signup    new_user.json
    Remove User By Email    ${payload['email']}    

    ${response}         POST User    ${payload}
    Status Should Be    200          ${response}


Duplicated email

    ${payload}    Get json    signup    duplicated.json

    POST User           ${payload}
    ${response}         POST User     ${payload} 
    Status Should Be    409           ${response}
