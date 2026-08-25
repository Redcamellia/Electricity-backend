import { hash, compare } from "bcrypt";

export async function hashPassword(plainPassword: string) {
  return await hash(plainPassword, 12);
}

export async function comparePassword(
  plainPassword: string,
  hashedPassword: string,
) {
  return await compare(plainPassword, hashedPassword);
}
