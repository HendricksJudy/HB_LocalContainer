from simple_evals.json_tools import load_valid, repair

def test_repair():
    bad = '```json\n{"explanation":"x","criteria_met":true,}\n```'
    fixed = repair(bad)
    assert fixed and load_valid(fixed)
