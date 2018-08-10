# API Documentation

**References**

* Link API: <https://influitive-referral-app.herokuapp.com>

* Invite to Slack: https://join.slack.com/t/referral-app-test/shared_invite/enQtNDE1MTg1MjY4NzI3LTA5NjRmOTZiYTE2ODQxYjdlODkxODViNWI4NWRmMTM1NDdjNjFlZTE5OTY5YmExMzUzOGY3OWM3ZDI3ZDczNGM

**Create a contact**
----
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

  * **Code:** 201 <br />
    **Content:** `{ "id": 1, "name": "Luiz", "email": "test@luiz.tech", "points": 0, "created_at": "2018-08-10T05:22:30.330Z", "updated_at": "2018-08-10T05:22:30.330Z" }`

* **Sample Call:**

  ```shell
  curl -X POST https://influitive-referral-app.herokuapp.com/contacts 
    -H 'content-type: application/json'
    -d '{ "name": "Luiz", "email": "test@luiz.tech"}'
  ```

**Show all contacts**
----
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

**Create a referral**
----
* **URL**

  /contacts/:id/referrals

* **Method:**

  `POST`
  
*  **URL Params**

    `id=[integer]`

* **Data Params**

    ```javascript
    {
      "name": "Fernando",
      "email": "test2@test.tech"
    }
    ```

* **Success Response:**

  * **Code:** 201 <br />
    **Content:** `{ "id": 9, "name": "Fernando", "email": "test2@test.tech", "contact_id": 1, "created_at": "2018-08-10T05:30:28.836Z", "updated_at": "2018-08-10T05:30:28.836Z" }`

* **Sample Call:**

  ```shell
  curl -X POST
  https://influitive-referral-app.herokuapp.com/contacts/1/referrals
    -H 'content-type: application/json'
    -d '{
          "name": "Fernando",
          "email": "test2@test.tech"
        }'
  ```

**Show all referrals**
----
* **URL**

  /contacts/:id/referrals

* **Method:**

  `GET`
  
*  **URL Params**

    `id=[integer]`

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[ { "id": 1, "name": "Luiz", "email": "test@luiz.tech", "contact_id": 1, "created_at": "2018-08-10T05:09:34.853Z", "updated_at": "2018-08-10T05:09:34.853Z" }, { "id": 9, "name": "Luiz", "email": "test@luiz.tech", "contact_id": 1, "created_at": "2018-08-10T05:30:28.836Z", "updated_at": "2018-08-10T05:30:28.836Z" } ]`

* **Sample Call:**

  ```shell
  curl -X GET https://influitive-referral-app.herokuapp.com/contacts/1/referrals
  ```

**Show leaderboard**
----

Show all contacts sorted by amount of referrals

* **URL**

  /leaderboard

* **Method:**

  `GET`
  
*  **URL Params**

    None

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[ { "id": 1, "name": "Luiz", "email": "test@luiz.tech", "points": 200, "created_at": "2018-08-10T05:09:26.215Z", "updated_at": "2018-08-10T05:30:28.843Z" }, { "id": 2, "name": "Luiz", "email": "test@luiz.tech", "points": 0, "created_at": "2018-08-10T18:29:47.844Z", "updated_at": "2018-08-10T18:29:47.844Z" }, { "id": 3, "name": "Luiz", "email": "test@luiz.tech", "points": 0, "created_at": "2018-08-10T18:30:49.075Z", "updated_at": "2018-08-10T18:30:49.075Z" } ]`

* **Sample Call:**

  ```shell
  curl -X GET https://influitive-referral-app.herokuapp.com/leaderboard
  ```
**Show all events**
----
* **URL**

  /events

* **Method:**

  `GET`
  
*  **URL Params**

    None

* **Data Params**

    None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `[ { "id": 1, "points": 100, "descriptions": "Referral awarded to contact id: 1. New score: 100", "event_type": "referral_awarded", "created_at": "2018-08-10T05:09:35.164Z", "updated_at": "2018-08-10T05:09:35.164Z" }, { "id": 2, "points": 100, "descriptions": "Referral awarded to contact id: 1. New score: 200", "event_type": "referral_awarded", "created_at": "2018-08-10T05:30:28.867Z", "updated_at": "2018-08-10T05:30:28.867Z" } ]`

* **Sample Call:**

  ```shell
  curl -X GET https://influitive-referral-app.herokuapp.com/events
  ```
