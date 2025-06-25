from simple_evals.healthbench_eval import calculate_score

def test_symmetric_score():
    r = [
        {"criteria_met": True,  "points":  2},
        {"criteria_met": False, "points":  2},
        {"criteria_met": True,  "points": -1},
        {"criteria_met": False, "points": -3},
    ]
    assert abs(calculate_score(r) - 0.5625) < 1e-6
