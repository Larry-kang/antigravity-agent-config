---
name: quantitative-research
description: Guides quantitative research workflows including data fetching, simulation, backtesting, and report generation. Use when analyzing tickers or running financial simulations.
---

# Quantitative Research Skill

This skill provides standardized workflows for quantitative analysis in the Sovereign Alpha Research (SAR) project.

## When to use this skill

- Analyzing new or existing tickers
- Running Monte Carlo simulations
- Generating financial forecasts
- Calculating risk metrics (CAGR, Volatility, Sharpe Ratio)
- Updating ticker research reports

## Standard Research Flow

### 1. Data Collection
**Goal**: Fetch historical price data for parameter calibration

```powershell
.bin\python\python.exe scripts/fetch_history_metrics.py
```

**Output**: Updates `ticker_params.json` with 5-year historical metrics
- CAGR (Compound Annual Growth Rate)
- Volatility (annualized standard deviation)
- Data source marked as `History (5Y)`

### 2. Parameter Calibration
**Goal**: Validate or manually adjust simulation parameters

**File**: `ticker_params.json`

**Structure**:
```json
{
  "BTC": {
    "cagr": 0.45,
    "volatility": 0.75,
    "source": "History (5Y)"
  }
}
```

**Decision**: Use historical vs manual parameters
- **Historical**: Ticker has 5+ years of data
- **Manual**: New assets, special scenarios, or strategic assumptions

### 3. Simulation Execution
**Goal**: Run Monte Carlo simulations for risk assessment

```powershell
.bin\python\python.exe scripts/simulate_ticker.py
```

**What it does**:
- Reads parameters from `ticker_params.json`
- Runs 10,000 Monte Carlo paths
- Calculates percentile outcomes (P10, P50, P90)
- Updates `*_Full_Analysis.md` Section 4 (Simulation Dashboard)

### 4. Report Generation
**Goal**: Create comprehensive analysis reports

```powershell
.bin\python\python.exe ops/generate_reports.py
```

**Outputs**:
- Daily briefs: `research/daily_briefs/Multi_Target_Analysis_[DATE].md`
- Ticker reports: `research/tickers/*_Full_Analysis.md`

### 5. Quality Validation
**Goal**: Ensure report quality before commit

```powershell
.bin\python\python.exe ops/lint_reports.py
```

**Checks**:
- UTF-8 encoding compliance
- No garbage/illegal characters
- Traditional Chinese language correctness

## Key Metrics & Concepts

### CAGR (Compound Annual Growth Rate)
- **Definition**: Annualized return rate
- **Formula**: `(End Value / Start Value)^(1/Years) - 1`
- **Use**: Expected return in simulations

### Volatility
- **Definition**: Annualized standard deviation of returns
- **Use**: Risk parameter in Monte Carlo simulations
- **Typical values**:
  - BTC: 60-80%
  - Stocks: 15-30%
  - Bonds: 5-10%

### Mayer Multiple (MM)
- **Definition**: `Current Price / 200-day Moving Average`
- **Use**: Cycle positioning indicator
- **Interpretation**:
  - MM < 0.6: Deep value zone
  - MM 0.6-1.0: Accumulation zone
  - MM 1.0-1.4: Fair value zone
  - MM 1.4-2.0: Risk reduction zone
  - MM > 2.0: Bubble warning zone

### Sharpe Ratio
- **Definition**: `(Return - Risk-Free Rate) / Volatility`
- **Use**: Risk-adjusted performance metric
- **Interpretation**: Higher is better (> 1.0 is good)

## SAP Four-Quadrant Rating

Every ticker must be classified into one of four categories:

| Symbol | Category | Characteristics | Examples |
|--------|----------|-----------------|----------|
| ?? | **Beta (Benchmark)** | Market-cap weighted, tracks index | 0050, VOO |
| ?? | **Alpha (Attack)** | Outperformance, beats market | NVDA, BTC, 00757 |
| ? | **Cash (Cash Flow)** | Stable dividends, income generation | 0056, 00878 |
| ?? | **Trap (Avoid)** | Dividend yield trap, structural decay | High yield but declining NAV |

## Decision Tree

### Q: Should I use historical or manual parameters?
- **Historical**: Ticker has 5+ years of clean data
- **Manual**: 
  - New assets (< 5 years history)
  - Strategic assumptions (e.g., conservative estimates)
  - Structural changes (e.g., post-merge ETH)

### Q: How many simulation paths?
- **Standard**: 10,000 paths (default in `simulate_ticker.py`)
- **Quick test**: 1,000 paths
- **High precision**: 50,000 paths (rarely needed)

### Q: Which timeframes to simulate?
- **Short-term**: 1 year (tactical decisions)
- **Mid-term**: 5 years (strategy validation)
- **Long-term**: 10 years (FIRE alignment)

### Q: When to update ticker reports?
- **Daily**: Core holdings (BTC, NVDA, TSMC, TSLA)
- **Weekly**: Secondary holdings
- **On-demand**: Major news or price movements

## Best Practices

1. **Always calibrate before simulating**: Run `fetch_history_metrics.py` first
2. **Validate parameters**: Check `ticker_params.json` for reasonableness
3. **Document assumptions**: Note manual parameter rationale in reports
4. **Run quality checks**: Use `lint_reports.py` before committing
5. **Update incrementally**: Don't regenerate all reports unless necessary

## Common Workflows

### New Ticker Analysis
1. Add ticker to tracking list
2. Run `/add-new-ticker` workflow
3. Fetch historical metrics
4. Run simulation
5. Generate report
6. Review and commit

### Daily Update
1. Run `/daily-routine` workflow
2. Fetch latest prices
3. Update core holdings only
4. Run risk forecast
5. Sync to Notion

### Deep Dive Research
1. Run `/ticker-deep-dive` workflow
2. Fetch comprehensive data
3. Run multi-horizon simulations
4. Generate full analysis report
5. Document review and commit
