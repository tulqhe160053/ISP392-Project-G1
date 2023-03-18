<%-- 
    Document   : tesst
    Created on : Mar 18, 2023, 10:14:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<div class="testbox">
  <form action="/">
    <h1>Customer Feedback Form</h1>
    <p>Please take a few minutes to give us feedback about our service by filling in this short Customer Feedback Form. We are conducting this research in order to measure your level of satisfaction with the quality of our service. We thank you for your participation.</p>
    <hr />
    <h3>Overall experience with our service</h3>
    <table>
      <tr>
        <th class="first-col"></th>
        <th>Very Good</th>
        <th>Good</th>
        <th>Fair</th>
        <th>Poor</th>
        <th>Very Poor</th>
      </tr>
      <tr>
        <td class="first-col">How would you rate your overall experience with our service?</td>
        <td><input type="radio" value="none" name="rate" /></td>
        <td><input type="radio" value="none" name="rate" /></td>
        <td><input type="radio" value="none" name="rate" /></td>
        <td><input type="radio" value="none" name="rate" /></td>
        <td><input type="radio" value="none" name="rate" /></td>
      </tr>
      ...
    </table>

    ...

    Email
    Only if you want to hear more from us.
    [_____________________________]

    [Send Feedback]
  </form>
    </body>
</html>
