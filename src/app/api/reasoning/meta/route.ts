import { NextResponse } from "next/server";

/**
 * ── Challenge 2, step 1: announce the service ─────────────────────────────
 * Why this route exists: before the grader sends your site 30 problems, it
 * knocks on this door and asks "who lives here?". The route answers with
 * your course token (the same SITE_TOKEN your /api/health echoes), which
 * proves the service answering is YOURS and not a classmate's URL pasted by
 * mistake. It also names the wire-contract version it speaks, so the grader
 * knows how to talk to it.
 */
export async function GET() {
  return NextResponse.json({
    service: "reasoning", // which decision service is answering
    specVersion: "1", // which version of the wire contract it speaks
    studentToken: process.env.SITE_TOKEN, // proves this service is yours
  });
}
