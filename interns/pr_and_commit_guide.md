# Guide to Pull Requests and Commits

Writing clear Pull Requests (PRs) and commit messages is crucial for collaboration and maintaining a clean project history.

## 1. How to Write a Great Commit Message

We follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.

**Schema (Format):**

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Common Types:**

*   `feat`: A new feature
*   `fix`: A bug fix
*   `docs`: Documentation only changes
*   `style`: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
*   `refactor`: A code change that neither fixes a bug nor adds a feature
*   `test`: Adding missing tests or correcting existing tests
*   `chore`: Changes to the build process or auxiliary tools and libraries such as documentation generation

**Example:**

```
feat(auth): add password reset functionality

Implements the server-side logic for resetting a user's password.
This includes a new API endpoint `/api/auth/reset-password` and a service
that generates a reset token and sends an email to the user.

Fixes #123
```

**More Commit Examples:**

*   **fix:**
    ```
    fix(api): correct calculation for order total

    The previous implementation was not including the tax in the final
    amount. This commit adds the tax to the total before returning the
    response.
    ```
*   **docs:**
    ```
    docs(readme): update setup instructions

    The setup instructions were outdated. This commit updates the README
    with the correct steps to set up the project locally.
    ```
*   **refactor:**
    ```
    refactor(user-service): switch to async/await

    The user service was using promise chains. This commit refactors
    the code to use async/await for better readability and error handling.
    ```

---

## 2. How to Write a Great Pull Request (PR) Description

A good PR description gives context to the reviewer.

**Schema (Template):**

> ### What does this PR do?
> 
> *(Provide a high-level summary of the changes.)*
> 
> ### Why is this change needed?
> 
> *(Explain the problem you are solving. Link to any relevant issues, e.g., "Fixes #123".)*
> 
> ### How were these changes implemented?
> 
> *(Describe the technical approach you took.)*
> 
> ### How can this be tested?
> 
> *(Provide step-by-step instructions for the reviewer to test your changes.)*
> 
> ### Screenshots (if applicable)
> 
> *(Add screenshots or GIFs to showcase UI changes.)*

**Example of a Complex PR Description:**

> ### What does this PR do?
>
> This PR introduces a new caching layer to the application using Redis. It caches frequently accessed data from the database to improve performance.
>
> ### Why is this change needed?
>
> Our application has been experiencing slow response times, especially for endpoints that fetch a lot of data. This change is needed to reduce the load on the database and improve the overall user experience. This PR addresses issue #456.
>
> ### How were these changes implemented?
>
> *   Added `ioredis` as a new dependency.
> *   Created a `CacheService` that abstracts the Redis logic.
> *   Modified the `ProductService` to use the `CacheService` to cache product data.
> *   Added unit tests for the `CacheService`.
>
> ### How can this be tested?
>
> 1.  Run `npm install` to install the new dependency.
> 2.  Make sure you have a local Redis server running.
> 3.  Start the application.
> 4.  Make a GET request to `/api/products`. The first request should be slow, and subsequent requests should be much faster.
> 5.  You can also connect to your Redis instance and check that the product data is being cached.

---

## 3. How to Respond to PR Comments

**Schema (Guidelines):**

*   **Be Responsive:** Acknowledge the feedback in a timely manner.
*   **Ask for Clarification:** If you don't understand a comment, ask for more details.
*   **Discuss and Collaborate:** If you have a different opinion, explain your reasoning respectfully. The goal is to find the best solution together.
*   **Keep it Professional:** Always be polite and constructive.
*   **Acknowledge and Implement:** Once you've addressed a comment (e.g., by pushing a new commit), reply to the comment to let the reviewer know. A simple "Done" or "Addressed" is often sufficient.

**Example Responses to Comments:**

*   **If you agree with the comment:**
    > "Good point! I've made the change."

*   **If you need clarification:**
    > "I'm not sure I fully understand. Could you please provide an example?"

*   **If you have a different opinion:**
    > "Thanks for the suggestion. I initially considered that approach, but I decided to go with this implementation because [Your reasoning]. What are your thoughts on this?"

---

## 4. Linking Issues

You can link a pull request to an issue to show that a fix is in progress and to automatically close the issue when the pull request is merged.

**Keywords:**

Use any of the following keywords followed by an issue number in your PR description:

*   `close`
*   `closes`
*   `closed`
*   `fix`
*   `fixes`
*   `fixed`
*   `resolve`
*   `resolves`
*   `resolved`

**Example:**

> This PR fixes #123.

---
