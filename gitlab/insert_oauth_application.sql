INSERT INTO oauth_applications (name, uid, secret, redirect_uri, scopes, created_at, updated_at, owner_id, owner_type)
VALUES (
    'Gitpod',
    'a6bdd1eef090b1890c68e5f8370782d05ee2ce8bfb95d9a1e0ed305427f35e10',
    '5464c983c47f6eb2e80dd37de28152de05ea5447d23643f7e71353d9fc3ad1c1',
    'https://gitpod.example.com/auth/gitlab/callback',
    'api read_user read_repository',
    now(), now(), 1, 'User'
);
