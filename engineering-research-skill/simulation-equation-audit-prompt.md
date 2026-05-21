# Simulation Equation Audit Prompt

Use for any simulation or numerical model audit. Follow `skills/simulation-equation-audit/SKILL.md`.

---

## English — Full Audit

```text
You are auditing a simulation or numerical model.
Do not only report whether the script runs successfully.

For every model generation, modification, or run, create or update:

model_equation_audit.md

Use templates/model-equation-audit-template.md as the structure.

The audit must include:

1. research question (controlled input, unknown output, purpose)
2. coordinate system and DOF (global/local, rotation axis, allowed DOF)
3. geometry and material parameters (value, unit, source)
4. physical governing equations (FEM vs analytical vs empirical; assumptions)
5. mapping between equations and software implementation
6. initial and boundary conditions
7. post-processing equations (formula, frame, unit, validity)
8. parameter scan definition (range, step, physical meaning)
9. numerical method and stability (interpolation, extrapolation, warnings, convergence)
10. output reliability classification (A/B/C/D per file)
11. assumptions and limitations
12. validation checklist (checkboxes)
13. final judgment (trust yes/partially/no; next fixes)

Reliability levels:
A = quantitative conclusion
B = trend reference
C = debug only
D = invalid / rerun required

If there are solver warnings, extrapolation, unit mismatch, unconstrained variables,
missing material assignments, or unclear coordinate transformations,
mark affected outputs as C or D.

Never claim a result is validated only because the script completed successfully.

Also produce when applicable:
- model_run_log.md (this run)
- model_output_reliability.md (many outputs)
- model_assumption_table.csv (many assumptions)

Model context:
- Toolchain: [COMSOL / Mathematica / MATLAB / Python / ...]
- Files: [paths]
- Logs: [paths]
- User concern: [what to verify]
```

---

## 中文 — 短版 Prompt

```text
请对当前仿真/数值模型生成或更新 model_equation_audit.md。

不要只说明“运行成功”，而要审计以下内容：

1. 研究问题：输入是什么，输出是什么，模型目的是什么；
2. 坐标系和自由度：全局坐标、局部坐标、旋转轴、平移轴、允许自由度；
3. 几何和材料参数：数值、单位、来源；
4. 物理方程：实际使用的控制方程、简化模型、假设和忽略项；
5. 软件实现映射：每个方程对应 COMSOL / Mathematica / MATLAB / Python 中的哪个节点、变量或函数；
6. 初始条件和边界条件；
7. 后处理公式：力、力矩、能量、压降、温度平均值等如何计算；
8. 参数扫描：扫描变量、范围、步长、物理含义；
9. 数值稳定性：插值范围、是否外推、求解器警告、收敛情况；
10. 输出可信度：每个输出文件标为 A/B/C/D；
11. 假设与局限；
12. 最终判断：当前结果可否采信，只能看趋势，还是必须重算。

可信度分级：
A = 可作为定量结论；
B = 可作为趋势参考；
C = 只能用于调试；
D = 不可信，必须重算。

如果出现外推、发散、单位混乱、坐标系不明、边界条件不明、自由度未定义、
材料域缺失或求解器警告，不得把结果标为 A。

模板：templates/model-equation-audit-template.md
技能：skills/simulation-equation-audit/SKILL.md

当前项目文件：
- [列出 mph / 脚本 / 日志路径]
```

---

## Adversarial Add-On

```text
After the audit, list 5 ways the current A/B-rated outputs could still be wrong
despite a converged solver and completed script.
Downgrade any output where the risk is unmitigated.
```
