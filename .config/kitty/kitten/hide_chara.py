from kitty.boss import Boss

def main(args: list[str]) -> str:
    hai = input("howdy!!\n")

    return hai

def handle_result(args: list[str], answer: str, target_window_id: int, boss: Boss) -> None:
    window = boss.window_id_map.get(target_window_id)

    if window is not None:
        w.paste_text(answer)
