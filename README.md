**Personal Details (JSON)**

1. Validates user details:

- advises if the specified name is already in the JSON file
- advises it the specified age is impossibly high
- advises if a field is too long (20+ characters)
- advises if the specified name contains non-letter characters
- advises if a number has anything other than a digit, comma or dot

2. If validation fails, user-specified details are retained in fields so the user can correct and re-submit.

3. Once user details are validated, the resulting hash is added to the JSON file kept in the /public subdirectory.

4. Afterwards, the user can enter details for another person or view details for other people already in the JSON file.

5. The table for viewing existing user details is dynamically populated from the JSON file.  Sorting names from (top > bottom) then (left > right) was tricky.

6. Selecting a user will open a dynamically populated user info page for that user with data populated from the JSON file.