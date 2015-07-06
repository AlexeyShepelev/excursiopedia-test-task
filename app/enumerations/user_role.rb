class UserRole < EnumerateIt::Base
  associate_values(
    user: 1,
    admin: 2,
    moderator: 3
  )
end
