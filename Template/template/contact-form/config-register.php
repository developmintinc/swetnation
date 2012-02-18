<?php

/**
 * The success message displayed when the form is successfully submitted
 */
$successMessage = '<div class="success-message">Thank you for registering.</div>';
$form->setSuccessMessage($successMessage);

/**
 * Configure the recipients of the message.  You can add multiple email
 * addresses by adding one on each line inside the array enclosed in quotes,
 * separated by commas. E.g.
 * $recipients = array(
 *     'recipient1@example.com',
 *     'recipient2@example.com'
 * );
 */
$recipients = array(
    'spam@themecatcher.net'
);

/**
 * Create the email success handler, this will email the
 * contents of the form to the set recipients when the form
 * is successfully submitted.
 */
$emailSuccessHandler = new iPhorm_SuccessHandler_Email($form);
$emailSuccessHandler->setRecipients($recipients);
$emailSuccessHandler->setSubject('%register_name% would like to be notified when you launch');

/**
 * Configure the name element
 * Filters: Trim
 * Validators: Required
 *
 * This example uses the addFilter and addValidator methods which are
 * used to add single filters or validators at a time.
 *
 * See documentation for more help with element configuration
 */
$name = new iPhorm_Element('register_name', 'Name');    // Create the name element
$name->addFilter('trim');                               // Add the Trim filter to the element
$name->addValidator('required');                        // Add the Required validator to the element (makes the field required)
$form->addElement($name);                               // Add the element to the form

/**
 * Configure the email element
 * Filters: Trim
 * Validators: Required, Email
 *
 * See documentation for more help with element configuration
 */
$email = new iPhorm_Element('register_email', 'Email'); // Create the email element
$email->addFilter('trim');                              // Add the Trim filter to the element
$email->addValidators(array('required', 'email'));      // Add the Required and Email validators to the element
$form->addElement($email);                              // Add the element to the form
