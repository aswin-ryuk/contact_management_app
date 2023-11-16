# README

This appliction is hosted on render - https://contact-management-app-dlz6.onrender.com/
(Initial load will take time, because server will be in halt state when it is not in use)

Note:

Api URL to create new contact record

* Post request - https://contact-management-app-dlz6.onrender.com/api/v1/contacts/

send the input data as raw json.

Json Input to create new contact record
```json
{
  "contact": {
    "first_name": "aswin",
    "last_name": "sounder",
    "email": "aswin@gmail.com",
    "phone_number": "9551104907",
    "address": "No 10, chennai, TN, India"
  }
}
```

Api URL to update the existing record(update the id field)

* PUT request - https://contact-management-app-dlz6.onrender.com/api/v1/contacts/:id

Json Input
```json
{
    "contact": {
      "id": 2,
      "first_name": "aswin",
      "last_name": "kumar",
      "email": "aswin@gmail.com",
      "phone_number": "9551104907",
      "address": "No 10, chennai, TN, India"
    }
}
```

Please find the test results

New record creation

![create result](https://github.com/aswin-ryuk/contact_management_app/blob/main/public/new_contact.png)

Update existing record

![update result](https://github.com/aswin-ryuk/contact_management_app/blob/main/public/update_contact.png)

Contact List Page

![Test results](https://github.com/aswin-ryuk/contact_management_app/blob/main/public/contact_index.png)

Webhook result

![Webhook result](https://github.com/aswin-ryuk/contact_management_app/blob/main/public/webhook.png)

Rspec test results

![Test results](https://github.com/aswin-ryuk/contact_management_app/blob/main/public/test_results.png)