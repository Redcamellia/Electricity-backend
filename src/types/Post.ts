export type Post = {
  post_id: number;
  created_at: Date;
  content: string;
  author_id: number;
};

export type PostCreationBlueprint = {
  content: string;
  author_id: number;
};
