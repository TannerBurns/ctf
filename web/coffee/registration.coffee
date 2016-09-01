recaptchaPublicKey = ""

reloadCaptcha = ->
  apiCall "GET", "/api/user/status", {}
  .done (data) ->
    console.log(data.data.enable_captcha)
    if data.data.enable_captcha
        grecaptcha.reset()
    ga('send', 'event', 'Registration', 'NewCaptcha')


setRequired = ->
    $('#user-registration-form :input').each () ->
        if not $(this).is(':checkbox')
            if not $(this).is(':radio')
                $(this).prop('required', $(this).is(":visible"))


checkEligibility = ->
    is_us = $("#country-select").val() in ["US", ""]
    is_k12 = $("#background-select").val() in ["student_el", "student_ms", "student_hs", "student_home"]
    is_student = $("#background-select").val() in ["student_el", "student_ms", "student_hs", "student_home", "student_undergrad", "student_grad"]
    is_teacher = $("#background-select").val() == "teacher"

    # This should be changed to reflect your eligibility requirements
    if not is_k12
        $("#eligibility-warning").show()
    else
        $("#eligibility-warning").hide()

    if is_student
        $("#school-group").show()
        if $("#registration-adviser-page").is(":visible")
            $("#button-new-team").click()

    if is_teacher
        $("#button-adviser").show()
    else
        $("#button-adviser").hide()

    setRequired()

submitRegistration = (e) ->
  e.preventDefault()

  registrationData = $("#user-registration-form").serializeObject()
  creatingNewTeam = $("#registration-new-team-page").is(":visible")
  creatingTeacherAccount = $("#registration-adviser-page").is(":visible")
  registrationData["create-new-team"] = creatingNewTeam
  registrationData["create-new-teacher"] = creatingTeacherAccount

  if creatingNewTeam
    registrationData["ctf-emails"] = $("#checkbox-emails-create").is(':checked')
    submitButton = "#register-button-create"
    logType = "NewTeam"
  else if creatingTeacherAccount
    registrationData["ctf-emails"] = $("#checkbox-emails-teacher").is(':checked')
    submitButton = "#register-button-teacher"
    logType = "NewTeacher"
  else
    registrationData["ctf-emails"] = $("#checkbox-emails-existing").is(':checked')
    submitButton = "#register-button-existing"
    logType = "JoinTeam"

  apiCall "POST", "/api/user/create", registrationData
  .done (data) ->
    switch data['status']
      when 0
        $(submitButton).apiNotify(data, {position: "right"})
        ga('send', 'event', 'Registration', 'Failure', logType + "::" + data.message)
        grecaptcha.reset()
      when 1
        ga('send', 'event', 'Registration', 'Success', logType)
        if creatingTeacherAccount
            document.location.href = "/classroom"
        else
            document.location.href = "/team"

$ ->
  apiCall "GET", "/api/user/status", {}
  .done (data) ->
    if data.data.enable_captcha
        grecaptcha.render("captcha", { "sitekey": recaptchaPublicKey })

  $("#user-registration-form").on "submit", submitRegistration

  $("#registration-new-team-page").hide()
  $("#registration-join-team-page").hide()
  $("#registration-adviser-page").hide()

  pageTransitionSpeed = 200

  # Note that this height/auto sillyness is specific to the known height relationship
  # between these pages. If one gets longer or shorter, we need to tweek it

  offset = 0 # Not sure why this value is necessary. Check later
  $("#button-new-team").click () ->
    #$("#stretch-box").css("min-height", $("#stretch-box").height()+offset)
    $("#registration-join-team-page").hide "slide", { direction: "up" }, pageTransitionSpeed, () ->
        $("#registration-adviser-page").hide "slide", { direction: "up" }, pageTransitionSpeed, () ->
            $("#registration-new-team-page").show "slide", { direction: "up" }, pageTransitionSpeed, () ->
                ga('send', 'event', 'Registration', 'Switch', 'NewTeam')
                setRequired()

  $("#button-join-team").click () ->
    #$("#stretch-box").css("min-height", $("#stretch-box").height()+offset)
    $("#registration-new-team-page").hide "slide", { direction: "up" }, pageTransitionSpeed, () ->
        $("#registration-adviser-page").hide "slide", { direction: "up" }, pageTransitionSpeed, () ->
            $("#registration-join-team-page").show "slide", { direction: "up" }, pageTransitionSpeed, () ->
                ga('send', 'event', 'Registration', 'Switch', 'JoinTeam')
                setRequired()

  $("#button-adviser").click () ->
    #$("#stretch-box").css("min-height", $("#stretch-box").height()+offset)
    $("#registration-new-team-page").hide "slide", { direction: "up" }, pageTransitionSpeed, () ->
        $("#registration-join-team-page").hide "slide", { direction: "up" }, pageTransitionSpeed, () ->
            $("#registration-adviser-page").show "slide", { direction: "up" }, pageTransitionSpeed, () ->
                ga('send', 'event', 'Registration', 'Switch', 'Teacher')
                setRequired()


  $("#country-select").on "change", checkEligibility
  $("#background-select").on "change", checkEligibility

  $("#country-select").html('
        <option value="US">United States of America</option>
        ')
