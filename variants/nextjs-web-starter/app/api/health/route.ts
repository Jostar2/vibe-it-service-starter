import { NextResponse } from "next/server";

export function GET() {
  return NextResponse.json({
    status: "ok",
    starter: "nextjs-web-starter",
    timestamp: new Date().toISOString(),
  });
}
