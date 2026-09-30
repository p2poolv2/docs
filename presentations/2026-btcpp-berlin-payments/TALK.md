# BTC++ Berlin: P2Poolv2 Payments — Talk Brief

**Conference:** BTC++ Berlin (payments track)
**Duration:** 30 minutes (27 content + 3 Q&A)
**Audience:** builders working on Lightning, Ark, ecash, statechains, covenant proposals
**Previous talks to avoid repeating:** Vienna BTC++ May 2026 — covered the hashrate market,
share pricing, and the Rigly/Braiins comparison. Keep those to one slide and link to the video.

---

## The spine in one sentence

Custody is control; the coinbase is the only custody-free payout; it doesn't scale;
today's L2s can't sit under it because of the txid problem; covenants fix that;
and swaps work today.

---

## Line of argument

Each section makes one claim that sets up the next.

### 1. The question (1 min)
**Claim:** paying miners at scale without custody is an unsolved payments problem.

- Open with: "How do you pay thousands of miners without anyone holding their rewards?"
- Leave it on screen. Every later section returns to it.

### 2. Custody is control (2.5 min)
**Claim:** whoever holds the rewards controls what gets mined.

- A pool doesn't need to reject your template. It just stops counting your shares.
- The accounting is the lever. A pool is a company in a jurisdiction, so that's where
  pressure lands.
- Source: p2poolv2.org — "Governments are good at cutting off the heads of a centrally
  controlled network… the accounting is the lever."

### 3. Today every pool is custodial (2.5 min)
**Claim:** the industry has decentralized templates but not payouts.

- The coinbase pays the pool. The pool pays miners later, under FPPS or PPLNS,
  subject to payout thresholds. Small miner balances sit in custody for weeks.
- SV2 and DATUM decentralize template construction, but payouts stay custodial
  for small miners.
- Source: docs.p2poolv2.org comparison page; p2poolv2.org comparison table.

### 4. P2Pool did it (3 min)
**Claim:** the coinbase itself can pay miners directly, with no custody at all.

- Launched 2011. A chain of shares, each a weak bitcoin block mined at a lower target.
- Every share's coinbase paid the PPLNS window proportionally.
- When a share met the bitcoin target, that coinbase became the block's coinbase
  and miners were paid on-chain, directly, with no operator in between.
- This is the only prior custody-free solution at pool scale.

### 5. But the coinbase doesn't scale (2 min)
**Claim:** direct coinbase payout is custody-free but capped by three problems.

- **Firmware cap:** Bitmain's firmware caps how many outputs a coinbase can carry.
  This directly capped how many miners P2Pool could pay, which capped variance reduction.
- **Blockspace cost:** 1000 coinbase outputs consume approximately 3.4% of a block.
  Source: Vienna BTC++ 2026 deck.
- **Dust:** tiny payouts for small miners are unspendable without aggregation.
- Transition: "We're building a fix. But first — the landscape has changed since 2011."

### 6. Tease and the new landscape (2 min)
**Claim:** bitcoin now has scaling tools P2Pool never had.

- "We have a solution. Hold that thought."
- Lightning, Ark, ecash, statechains, covenants — none of these existed when P2Pool
  hit its wall.
- One slide, five logos.
- "Can any of them pay miners? First, what does 'pay miners' actually require?"

### 7. The requirements (2.5 min)
**Claim:** any answer must meet five requirements.

These are verbatim from docs.p2poolv2.org/requirements.html:

1. **Unilateral exit** — no entity must sign before a miner takes custody.
   The argument: any such entity can hold miners hostage.
2. **Commitment at template time** — the work a miner hashes must commit to their payout.
   Miners verify that the work they hash includes their payouts in the correct proportion.
3. **Deterministic and verifiable** — every node recomputes the payouts independently.
4. **Scale** — approximately 1000 nodes, each serving thousands of ASIC miners,
   without hitting coinbase size limits.
5. **Small-miner support** — tiny payouts must be spendable without a third party signing.

Add two swap-derived constraints (from the repo's atomic-swap docs):
6. The miner must be able to **receive** (an LN invoice, an Ark wallet, etc.).
7. Settlement must fit inside the **trading window** (see numbers below).

### 8. The txid problem (2 min)
**Claim:** you cannot pre-sign a spend of the coinbase, because its txid doesn't
exist until the block is found.

- Miners roll the extranonce inside the coinbase on every hash batch.
  The txid is `sha256d(coinbase_tx)` and changes with every extranonce roll.
- Any protocol that needs a pre-signed transaction spending the coinbase output
  has nothing to sign at template time.
- Signing *after* the block is found makes the signer a gatekeeper: they can refuse,
  and the miner's reward is held hostage. This breaks unilateral exit (requirement 1).

**How it was reached:** initially the talk framed LN, Ark, and statechains as open
questions ("can your system do this?"). Reviewing what each protocol actually needs
(commitment transactions, VTXO trees, backup transactions — all pre-signed spends
of the funding/coinbase output) showed the failure is structural, not a detail to
be worked around. Ecash fails the other way: it avoids the txid problem only by
taking custody.

### 9. Today's L2s can't sit under the coinbase (3 min)
**Claim:** every L2 fails the requirements, in one of two ways.

- **Lightning:** needs a signed refund (commitment) transaction before the channel
  is funded. That transaction spends the funding output by txid. No txid → cannot
  open channel at template time. Signing after block found → gatekeeper.
  Secondary issue: 100-block coinbase maturity before the channel could be used anyway.
- **Ark (without covenants):** the VTXO tree must be pre-signed by the ASP and
  participants. The tree's root spends the shared output by outpoint.
  Same failure as Lightning.
- **Statechains:** the backup (unilateral exit) transaction must be pre-signed,
  spending a known outpoint. Same failure.
**The federation detour:**
At this point someone will suggest: "put the coinbase into a multisig key rather
than a single custodian." This is worth addressing directly because it seems to
thread the needle.

- The coinbase must commit to *some* key at template time. If that key is an n-of-n
  or t-of-n multisig, you have a federation: a group that collectively holds miners'
  rewards until they sign a payout.
- A federation is still custody — just custody distributed across a larger group.
  Unilateral exit (requirement 1) is still broken: miners cannot take custody without
  the federation signing.
- The lever from section 2 is still there. It now requires coordinating t signers
  rather than one operator, but it hasn't been removed.
- **Sock puppet vulnerability:** a federation's trust model assumes signers are
  independent. An adversary (a state, a cartel, a single well-resourced actor) can
  control multiple seats in the federation without revealing this. With enough seats,
  they reconstruct the key and the federation provides no protection beyond the
  appearance of decentralization. This is not a theoretical concern: it is the same
  attack that motivates threshold assumptions in Fedimint and concerns about
  Lightning node clustering.
- The honest version of this detour is ecash: Fedimint makes the federation explicit
  and provides the best UX for tiny payouts. But it cannot claim to remove custody,
  only to distribute it.

- **Ecash:** there are three ways ecash can interact with p2poolv2, each with a
  different trust profile. Say this explicitly on stage because ecash builders
  will know the distinctions.

  *Case 1: neutral mint, third-party buyer (trust-minimised swap).*
  A market maker buys a share-chain UTXO and pays with ecash tokens locked under
  the same hash (NUT-11 pubkey lock + NUT-14 HTLC conditions in Cashu).
  1. Miner generates secret s, publishes H = hash(s).
  2. Miner locks share-chain UTXO to buyer's key + s, long refund timelock to miner.
  3. Buyer sends ecash locked to miner's key + s, shorter refund timelock to buyer.
  4. Miner verifies tokens via mint's NUT-07 state check.
  5. Miner redeems tokens, revealing s.
  6. Buyer learns s from the mint's spent-proof witness, claims share UTXO.
  This is a true atomic swap. The mint is a neutral enforcer, not a party to the
  trade. The free option problem still applies: the miner can wait for the share's
  value to move before redeeming. The timelock gap must be short relative to how
  fast share value shifts in the PPLNS window.

  *Case 2: the mint is the buyer (custodial in substance).*
  The mint acts as market maker, buying shares directly and holding the PPLNS
  reward stream. The HTLC adds almost nothing here: the mint enforces its own
  ecash conditions and after learning s could simply refuse the swap. Atomic in
  form, custodial in substance. Say this plainly — ecash builders will know it.
  The upside is operational simplicity: the mint prices shares by time left in
  the window, pays instantly and privately, and collects BTC when blocks are found.

  *Case 3: skip shares entirely (Hydrapool-style).*
  A centralised PPLNS node, or a federation of p2poolv2 operators running Fedimint,
  credits PPLNS earnings directly as ecash. No dust, no on-chain fees for tiny
  payouts, best UX for small miners. The cost is that you're back to trusting the
  pool operator — or a committee of them, with the sock puppet vulnerability from
  above. This is the ecash version of the federation detour.

  The framing for the slide: the share chain holds trustless value; ecash is the
  private, instant last mile. Case 1 keeps the swap trust-minimised. Cases 2 and
  3 buy simplicity and small-payout efficiency by adding custody. Ask the room
  which they'd recommend for a home miner earning a few thousand sats per day.

Visual: a table. Columns: unilateral exit / pre-signed spend needed / fails txid /
custody. Rows: LN, Ark, statechains, ecash, n-of-n multisig/federation.

### 10. Covenants fix it (2 min)
**Claim:** commitments that don't bind the outpoint remove the txid problem.

- **CTV (BIP 119):** commits to the outputs of the spending transaction, not its
  inputs. A coinbase output carrying a CTV hash commits non-interactively to a
  payout tree. An Ark round tree could be committed this way too.
- **APO / ANYPREVOUT:** signatures don't commit to the prevout, so a channel
  refund transaction can be signed before the coinbase txid exists.
- **CCV / MATT:** more general covenant that could commit to a coinpool with
  unilateral exit from any leaf.
- This meets all five requirements, scales to any number of miners, and requires
  no interaction at template time. It needs a soft fork.
- Ask for the room: which proposal fits the payout tree structure best?
  What does a leaf exit cost at depth 10 vs depth 20?

### 11. Our answer today: move the payment off the coinbase (2.5 min)
**Claim:** a share-chain UTXO has a known txid once confirmed, so L2s work as
the *other side* of a swap.

- Pay the top N miners directly in the bitcoin coinbase (currently sized for ~500
  P2WPKH outputs via `blockmaxweight=3930000`; target 10–50 market makers once
  swaps are running).
- Every other miner earns a share-chain coinbase UTXO on a key they hold.
- That UTXO is sold to a market maker via an atomic swap:
  - Miner (Alice) creates a Lightning invoice or Ark VHTLC using a random preimage R
    and its SHA256 hash as the payment hash.
  - Alice locks her share-chain UTXO in a P2TR HTLC under the same hash.
  - Market maker (Bob) verifies both sides match, pays the invoice.
  - Payment reveals R to Bob. Bob spends the share-chain HTLC with R.
- Three spending paths in the P2TR HTLC (from repo docs/atomic-swap/htlc_scripts.md):
  1. **Redeem:** hash preimage + redeemer signature (happy path).
  2. **Mutual instant refund:** 2-of-2 multisig, no timelock.
  3. **Initiator refund:** CSV delay, initiator signature alone.
  Key path is a NUMS point (no key-path spend possible).
- **The payoff line:** the txid property that broke L2s in section 9 is exactly what
  makes them work here. The share-chain UTXO confirms before trading begins.

### 12. The challenges (2 min)
**Claim:** both paths have open problems this room is best placed to solve.

For **covenant authors:**
- Which proposal (CTV, APO, CCV, TXHASH) fits the payout tree structure?
- What does the fee market for unilateral exits look like for a small miner
  at a leaf deep in the tree?
- Can tiny miners afford to exit, or does small-miner support still need
  something on top of covenants?

For **L2 builders:**
- **Timelocks:** the share-chain CSV must exceed the LN/Ark expiry plus confirmation
  time, and the whole swap must close before the PPLNS window moves past the
  share's depth. These parameters are not yet specified.
- **The free option:** Alice locks her shares first. Bob holds a free option: he
  can wait to see whether the pool finds a block or hashrate shifts before deciding
  to pay. Four approaches from the literature, plus one p2poolv2-specific idea.

  *How bad is it?* Both legs are BTC-denominated so USD/BTC volatility doesn't
  matter. Share value moves two ways:
  - **Slow drift** — PPLNS decay, hashrate dilution, fee-rate changes. Near zero
    over an hour. Optionality from smooth diffusion is tiny.
  - **Block-find jumps** — the pool finding a Bitcoin block mid-swap. Chance per
    hour ≈ h·T/600 s where h is the pool's share of network hashrate. At ignition
    scale (~0.5 EH/s) this is well under 1% per hour; at 1% of network hashrate
    it is about 6%. The jump is publicly observable, so whoever holds the option
    can wait and then decide.

  *Fix 1: price it.* Liu's "Atomic Swaptions" (2018) and Han, Lin & Yu's "On the
  Optionality and Fairness of Atomic Swaps" (2019) model the initiator's position
  as an American call and propose an upfront premium. At low pool hashrate the
  fair premium is tiny.

  *Fix 2: forfeitable deposit.* Xue & Herlihy (PODC 2021) and Nadahalli,
  Khabbazian & Wattenhofer's "Grief-free Atomic Swaps" (2022) use escrowed
  premiums forfeited if the buyer walks away. Implementable in Bitcoin script today.

  *Fix 3: shrink the window.* Move the BTC leg to Lightning or Ark so the
  practical window collapses to seconds. The theoretical CLTV window still exists
  but the economic exposure is negligible. The 10 s share chain doesn't help by
  itself — the option's duration is set by the Bitcoin leg.

  *Fix 4: block-find attribution rule.* Define that the seller retains any block
  payouts until the swap claim confirms on the share chain. This removes most of
  the jump value from the option.

  *Fix 5 (p2poolv2-specific): Bitcoin-verified share transfers — remove the
  hashlock entirely.*
  p2poolv2 nodes already track Bitcoin headers, so the share chain can verify SPV
  proofs directly. Instead of an HTLC, the seller locks the share output into a
  conditional transfer that resolves when the buyer's Bitcoin payment reaches
  confirmation depth k:
  1. Seller locks the share-chain output committing to: buyer pubkey, price in
     sats, Bitcoin expiry height H_exp, confirmation depth k, and a unique payment
     destination P = seller_key + H(seller_key ‖ offer)·G (per-offer derivation
     prevents one payment satisfying two offers).
  2. Buyer pays the price to P on Bitcoin (multiple offers can be batched in one tx).
  3. Buyer submits a share-chain claim with the Bitcoin tx and merkle proof.
     Share-chain nodes check: output ≥ price, included at height ≤ H_exp, at least
     k blocks deep.
  4. If the proof passes, the share output transfers to the buyer. Seller refund
     is only valid at H_exp + k + grace with no qualifying payment present.

  This removes the seller's option entirely — no secret to withhold, seller
  doesn't need to be online to settle. Censorship on the share chain only delays
  the claim, it cannot convert it to a refund. The buyer still holds a short
  option (pay or don't before H_exp), mitigated by setting H_exp 1–3 Bitcoin
  blocks ahead and charging a small premium over Lightning upfront.

  Engineering costs:
  - **Reorg coupling:** a Bitcoin reorg deeper than k could remove a payment after
    the share-chain claim was accepted. Scale k with trade size (2 for small, 6
    for large) or accept as a rare edge case.
  - **View divergence:** nodes that haven't seen the referenced Bitcoin block must
    defer (not reject) the claim. Include claims only at depth k+1; keep an
    orphan-claim pool.
  - **Validation surface:** needs a native transaction type or opcode for merkle-
    proof verification against the Bitcoin header chain.
  - **Every trade costs one on-chain Bitcoin tx.** HTLCs with short share-chain
    timelocks remain the complementary path for off-chain BTC legs.

  Prior art: essentially BTC Relay — one chain verifying another's SPV proofs.
  Unusually clean here because the verifying chain already tracks Bitcoin headers.
- **Receiving:** a small miner earning a few thousand sats needs inbound liquidity
  (LN), an Ark wallet, or ecash. Which rail makes receiving painless at that scale?

For **everyone:**
- "We couldn't find a way around the txid problem without a soft fork. Can you?"
- Close by putting the opening question back on screen.

---

## Numbers and facts

| Fact | Value | Source |
|---|---|---|
| Share interval | ~10 seconds (site says this; wiki says 30s — reconcile before the talk) | p2poolv2.org |
| Share-chain coinbase maturity | ~1 day of share blocks (wiki says 2880 blocks at 30s; site says "about a day") | wiki, p2poolv2.org |
| PPLNS trading window closes | when the share's depth exceeds the PPLNS window | wiki |
| Target coinbase outputs (today) | ~500 P2WPKH via `blockmaxweight=3930000` | README |
| Target coinbase outputs (with swaps) | 10–50 market makers | wiki payout page |
| 1000 coinbase outputs blockspace | ~3.4% of a block | Vienna 2026 deck |
| S19 Pro share stat | 99.9999996% chance two S19 Pros find at least one share in a two-week period, counting uncles (99.2% without uncles), assuming 1% of network hashrate | p2poolv2.org |
| HTLC hash function | SHA256 | htlc_scripts.md |
| Swap docs location | docs/atomic-swap/ in the repo | repo |

**Inconsistencies to resolve before the talk:**
- Share interval: 10 seconds (p2poolv2.org) vs 30 seconds (wiki payout page, which
  flags itself as "slightly outdated"). Use 10 seconds.
- Maturity: "about a day" (site) vs 2880 blocks at 30s (wiki) vs 100 blocks (wiki
  trading window diagram caption). Clarify the canonical number.
- License: README shows AGPL-3.0; p2poolv2.org and docs.p2poolv2.org say MIT or
  Apache-2.0. Irrelevant to the talk but worth fixing in the repo.

---

## Diagram list

Suggested tooling: Graphviz (`.dot`) for DAGs and trees; PlantUML for sequence
diagrams. Both render cleanly to SVG for embedding in slides.

1. **Extranonce rolling → txid change** (Graphviz)
   Show the coinbase transaction with the extranonce field highlighted, arrows to
   two different txids. The point: no stable outpoint exists before the block is found.

2. **P2Pool coinbase paying the PPLNS window** (Graphviz)
   Six shares in the window, three miners, proportional outputs in the coinbase.
   Source: coinbase-payout.svg on docs.p2poolv2.org/payouts/coinbase.html.

3. **L2 failure table** (simple table slide, not a diagram)
   Columns: pre-signed spend needed / hits txid problem / takes custody / breaks req.
   Rows: Lightning, Ark (no covenants), statechains, ecash.

4. **CTV payout tree from a single coinbase output** (Graphviz)
   Coinbase output → CTV hash → binary tree of outputs → miner addresses at leaves.
   Show unilateral exit path from a leaf.

5. **Trading window timeline** (Graphviz or simple SVG)
   Horizontal axis: time. Three markers: share mined, maturity (share tradeable),
   PPLNS window expiry (share no longer counts). The trading window is between the
   second and third markers.

6. **Atomic swap sequence** (PlantUML sequence diagram)
   Participants: Alice (miner), Share Chain, Lightning/Ark, Bob (market maker).
   Steps: Alice creates invoice → Alice locks HTLC on share chain → Bob verifies
   both sides → Bob pays invoice → preimage revealed → Bob claims share HTLC.
   Include the refund path (timeout → Alice reclaims).

7. **P2TR HTLC tree** (Graphviz)
   Taproot tree: NUMS key path (disabled), script path with three leaves:
   redeem (hash + redeemer sig), mutual refund (2-of-2), timeout refund (CSV + initiator sig).

8. **End-to-end architecture** (Graphviz)
   Show the full picture: bitcoin chain, share chain, lightning/ark rail,
   and which payments flow where: large miners ← coinbase, small miners ← swap ← BTC rail.

---

## What the Vienna talk already covered

Do not re-cover in detail:
- The hashrate market concept and why it's interesting.
- Pricing shares as options (the greeks).
- The Rigly / Braiins / P2Poolv2 comparison table.
- The open challenge on tradfi engagement.

Reference with one slide: "If you saw Vienna, this is the market those swaps
create. Today we focus on the payments infrastructure underneath it."
Video: https://youtu.be/7ximtqDoaEU?si=1KUxV_GXFuu9FAD9

---

## Sources pulled in this conversation

- https://p2poolv2.org (full page)
- https://docs.p2poolv2.org/requirements.html
- https://docs.p2poolv2.org/payouts/ (index)
- https://docs.p2poolv2.org/payouts/coinbase.html
- https://docs.p2poolv2.org/payouts/marketplace.html
- https://docs.p2poolv2.org/payouts/onchain.html (stub)
- https://docs.p2poolv2.org/payouts/l2_swaps.html (stub)
- https://docs.p2poolv2.org/payouts/pricing_shares_as_options.html (stub)
- p2poolv2/p2poolv2 repo: docs/atomic-swap/htlc_scripts.md
- p2poolv2/p2poolv2 repo: docs/atomic-swap/p2pool-2-lightinig-example.md
- p2poolv2/p2poolv2 wiki: Payout mechanism - Trading Shares For Bitcoin.md
- p2poolv2/p2poolv2 wiki: Wallet Requirements.md
- p2poolv2/p2poolv2 wiki: Payouts PPLNS With Decay.md
- p2poolv2/p2poolv2 wiki: Presentations.md
- p2poolv2/p2poolv2 wiki: P2Pool vs P2Poolv2.md
- presentations/P2Poolv2-Hashrate-Market-btcplusplus-Vienna-2026.pdf (text extracted)

---

## Key reasoning that shaped the structure

**Why "challenge the audience" still works despite the txid constraint:**
Initially the talk was framed as open questions to each protocol ("can your system
do this?"). Reviewing what Lightning, Ark, and statechains actually need — all
require a pre-signed transaction spending the coinbase output by txid — showed the
failure is structural. Ecash fails the other way: it avoids the txid problem only
by taking custody. This collapses five open questions into one crisp constraint.

But the challenge to the audience shifts rather than disappears:
- Covenant authors have a concrete use case: design the payout tree.
- L2 builders have swap-specific problems: timelocks, the free option, tiny miner receiving.
- Everyone can try to break the txid claim without a soft fork.

**Why the talk ends with swaps rather than opening with them:**
The swap is the answer, but saying "we use swaps" at the start makes the L2
analysis feel like a digression. Running the argument in order — custody bad,
coinbase is the fix, coinbase doesn't scale, L2s can't sit under it, here's why,
here's what covenants do, here's what swaps do — means the swap lands as the
logical consequence of the constraints rather than an unexplained design choice.

**Why the txid problem is the crux:**
The requirement of commitment at template time (requirement 2) and unilateral exit
(requirement 1) together rule out the obvious move of funding an L2 from the
coinbase. Requirement 2 means nothing can be decided after the block is found.
Requirement 1 means you can't rely on any other party's signature. Together they
demand a pre-commitment to the output structure with no interactive step — which
is exactly what CTV and related proposals provide, and exactly what today's
L2 protocols cannot.
