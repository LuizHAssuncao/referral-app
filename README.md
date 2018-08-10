# README

**API Documentation**

Link API: <https://influitive-referral-app.herokuapp.com/>

**Create a contact**
----
  Request a contact creation

* **URL**

  /contacts

* **Method:**

  `POST`
  
*  **URL Params**

    None

* **Data Params**

    ```javascript
    {
      "name": "Luiz",
      "email": "test@test.tech"
    }
    ```

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ "id": 1, "name": "Luiz", "email": "test@luiz.tech", "points": 0, "created_at": "2018-08-10T05:22:30.330Z", "updated_at": "2018-08-10T05:22:30.330Z" }`

* **Sample Call:**

  ```shell
  curl -X POST https://influitive-referral-app.herokuapp.com/contacts -H 'content-type: application/json' -d '{ "name": "Luiz", "email": "test@luiz.tech"}'
  ```

**Show Contacts**
----
  Returns json data about all contacts.

* **URL**

  /contacts

* **Method:**

  `GET`
  
*  **URL Params**

    None

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[ { "id": 1, "name": "Luiz", "email": "test@test.tech", "contact_id": 1, "created_at": "2018-08-10T05:09:34.853Z", "updated_at": "2018-08-10T05:09:34.853Z" } ]`

* **Sample Call:**

  ```shell
  curl -X GET https://influitive-referral-app.herokuapp.com/contacts
  ```
