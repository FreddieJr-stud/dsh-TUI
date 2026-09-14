// Deterministic drift check: does the UI still consider the installed engine unvalidated?
import { UPSTREAM_VALIDATED_VERSION, UPSTREAM_VALIDATED_VERSIONS, upstreamDrift, upstreamDriftSummary }
  from './lib/types/dsh-adapter/contract.js'

console.log('validated (primary):', UPSTREAM_VALIDATED_VERSION)
console.log('accepted lines      :', UPSTREAM_VALIDATED_VERSIONS.join(', '))
try {
  const d = upstreamDrift()
  const entries = Array.isArray(d) ? d : [d]
  const bad = entries.filter(e => e && (e.kind === 'newer' || e.kind === 'unvalidated' || e.drift))
  console.log('drift entries       :', entries.length, '| flagged:', bad.length)
  for (const e of entries.slice(0, 6)) console.log('   ', JSON.stringify(e).slice(0, 160))
  const s = upstreamDriftSummary()
  console.log('summary             :', s ? JSON.stringify(s).slice(0, 200) : '(none - no boot warning)')
} catch (e) {
  console.log('drift check error   :', e.message)
}
