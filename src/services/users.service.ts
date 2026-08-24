import { User } from "../types/User";

const users: User[] = [
  {
    id: 1,
    name: "Alice",
  },
  {
    id: 2,
    name: "Bob",
  },
];

export function getAllUsers(): Promise<User[]> {
  //   throw new Error("async function exploded");
  return Promise.resolve(users);
}
