# true
rooms = [[1], [2], [3], []]
# false
rooms2 = [[1, 3], [3, 0, 1], [2], [0]]
# true
rooms3 = [[1, 2, 3], [3, 0, 1], [2], [0]]

Solution.can_visit_all_rooms(rooms)
Solution.can_visit_all_rooms(rooms2)
Solution.can_visit_all_rooms(rooms3)
