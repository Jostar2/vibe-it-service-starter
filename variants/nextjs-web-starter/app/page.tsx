export default function Home() {
  return (
    <main className="page-shell">
      <section className="hero">
        <p className="eyebrow">nextjs-web-starter</p>
        <h1>Start the service, then replace the placeholders fast.</h1>
        <p className="lede">
          This variant keeps the base checkpoint workflow while giving you a minimal
          Next.js application, a health route, and a clear place to write the real
          product scope before feature work begins.
        </p>
      </section>

      <section className="grid">
        <article className="card">
          <h2>Product scope first</h2>
          <p>
            Update <code>docs/brief.md</code>, <code>docs/tasks.md</code>, and the
            dashboard in <code>README.md</code> before product-specific code expands.
          </p>
        </article>
        <article className="card">
          <h2>Health route included</h2>
          <p>
            The starter ships with <code>/api/health</code> so the first deployment
            can prove the service loop without additional infrastructure.
          </p>
        </article>
        <article className="card">
          <h2>Verification stays local</h2>
          <p>
            Run <code>npm run lint</code> and <code>npm run verify:repo</code> before
            each checkpoint-worthy commit.
          </p>
        </article>
      </section>
    </main>
  );
}
