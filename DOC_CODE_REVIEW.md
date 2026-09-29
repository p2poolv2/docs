# Docs and Code Review List

The docs describe the design P2Poolv2 is working toward, and the code
in `../p2pool-v2` is behind them in places. This list tracks every
difference and open issue found while writing the docs, for a review
once the docs are complete. It is excluded from the site build.

Code paths are relative to `p2pool-v2/p2poolv2_lib/src`.

## Where the Code Differs From the Docs

- [ ] **PPLNS window excludes immature shares.**
  `architecture/pplns_accounting.adoc` says the newest 6,048 shares are
  left out of PPLNS accounting and the 120,960-share window starts after
  them. The code measures the window back from the tip, immature shares
  included (`is_in_pplns_zone` in `shares/validation/mod.rs`,
  `MAX_PPLNS_WINDOW_SHARES`).
- [ ] **Shares expire at the end of the window.** Per the page, a share
  expires 6,048 + 120,960 shares deep. The code expires outputs whose
  coinbase root is more than one window (120,960 shares) old
  (`p2pool-v2/docs/architecture/pruning.md`). The same rule decides
  when a spent output expires in
  `architecture/spending-coinbases-and-root-heights.adoc`.
- [ ] **Mining on the current bitcoin chain.**
  `architecture/validation.adoc` ("Mine on the Current Bitcoin Chain"
  and "Bitcoin Blocks Are Not Validated") and `requirements.adoc`
  ("Mining on the Current Chain") say nodes verify that each share's
  bitcoin header is reachable from its parent's. No such check exists;
  `validate_bitcoin_block` in `shares/validation/bitcoin_block_validation.rs`
  is unused (`#[allow(dead_code)]`).
- [ ] **An uncle serves only one nephew.** `architecture/validation.adoc`
  says a shareblock can be an uncle only if it is not already one. The
  code uses `is_already_uncle` only when a node selects uncles for its
  own shares; validation accepts a second nephew
  (`store/dag_store.rs`, `docs/architecture/share-processing-pipeline.md`
  "Uncle selection vs uncle acceptance").
- [ ] **Payout check anchor.** `architecture/sharechain.adoc` says a node
  rejects a share whose payouts differ from its own local view. The code
  checks against the PPLNS distribution ending at the share's parent
  (`prev_share_blockhash`), and drops a share without a verdict when the
  node no longer holds that window (`validate_bitcoin_payout`).
- [ ] **Coinbase value is not committed.** `ShareCommitment` has a
  `coinbase_value` field, but `commitment_digest` leaves it out of the
  hash (`shares/share_commitment.rs`). Relevant to "Payout Commitment at
  Template Time" in `requirements.adoc`.
- [ ] **Coinbase size and top-N payouts.** `requirements.adoc`
  ("Scalability") relies on paying only the largest miners in the
  coinbase. No code limits coinbase outputs to N miners; the interim
  target is about 500 outputs.
- [ ] **Share trading.** `requirements.adoc` ("Small Miner Support") and
  the payout pages rely on miners spending and trading shares. There is
  no transaction construction, submission path, or wallet yet
  (`p2pool-v2/WALLET_API_PLAN.md`, `docs/architecture/address-format.md`).
- [ ] **Swap timelocks.** Atomic swaps need timelocks longer than the
  reorg depth that coinbase maturity guards against. They are not
  specified yet (`p2pool-v2/docs/atomic-swap/p2pool-2-lightinig-example.md`).
- [ ] **Unilateral exits and Ark.** `requirements.adoc` ("Unilateral
  Exits") and `payouts/ark.adoc` have no counterpart in the code or the
  node's design documents.
- [ ] **Uncle ancestry rule.** Validation rejects an uncle that is an
  ancestor of its nephew. `architecture/validation.adoc` does not list
  this rule.
- [ ] **Transaction fees.** `architecture/transactions.adoc` ("Handling
  Fees") says fees go to the miner who mines the share, and that fee
  outputs keep their root height under the splitting rules. The code lets a transaction's inputs
  exceed its outputs, but the share coinbase always pays exactly one
  share unit (`build_sharechain_coinbase_transaction` in
  `shares/transactions/coinbase.rs`), so fees are not collected today.
- [ ] **Script library.** `architecture/transactions.adoc` plans a move
  to `rust-miniscript`, with its version part of sharechain consensus.
  The code verifies scripts with `bitcoinconsensus::verify`.

## Open Issues in the Docs

- [ ] **Where a share starts earning.** `architecture/sharechain.adoc`
  ("Shares Have a Valuation") says every share within a certain depth of
  the tip earns. `architecture/pplns_accounting.adoc` now excludes the
  newest 6,048 shares.
- [ ] **Old maturity figure.** The commented-out paragraph in
  `architecture/validation.adoc` says coinbases mature after an hour and
  that bitcoin needs about a day. Maturity is 6,048 shares (about
  16.8 hours), and bitcoin's 100 blocks take about 16.7 hours.
- [ ] **Unclear phrase.** `getting_started.adoc`: "a blockchain of weak
  bitcoin blocks that supports blocks".
- [ ] **Likely typo in a command.** `README.adoc`:
  `bundle exec jekyll serve --livereloadshare` (probably `--livereload`).
- [ ] **ASERT link.** `p2p_network_of_miners.adoc` links to "Stratum
  Server & Vardiff" for details on ASERT, but that page covers per-miner
  vardiff. "Pool Vardiff" (`pool_difficulty_adjustment.adoc`) may be the
  right target.
- [ ] **Unverified OCEAN claim.** `compare_datum_sv2.adoc` ("At a
  Glance") says OCEAN holds small balances. Check against OCEAN's
  documentation.
- [ ] **Coinbase-only mode caveat.** `compare_datum_sv2.adoc` should say
  an SV2 pool can be ordered to disable coinbase-only mode.
- [ ] **51% claim.** `compare_datum_sv2.adoc` should note that
  sharechain hashrate is small, so a majority is cheaper than on
  bitcoin, and that forking the pool has a cost.
- [ ] **Do shares carry full transaction lists?** `compare_datum_sv2.adoc`
  compares P2Poolv2 with SV2 coinbase-only mode. If shares carry the
  bitcoin block's transactions, peers can see them, which weakens that
  comparison.
