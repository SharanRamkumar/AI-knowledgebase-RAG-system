CREATE OR REPLACE FUNCTION public.match_documents(
    query_embedding vector,
    match_count integer DEFAULT 5,
    filter jsonb DEFAULT '{}'
)
RETURNS TABLE (
    id bigint,
    content text,
    metadata jsonb,
    similarity double precision
)
LANGUAGE sql
STABLE
AS $$
SELECT
    rag_docs.id,
    rag_docs.content,
    rag_docs.metadata,
    1 - (rag_docs.embedding <=> query_embedding) AS similarity
FROM rag_docs
WHERE rag_docs.metadata @> filter
ORDER BY rag_docs.embedding <=> query_embedding
LIMIT match_count;
$$;
