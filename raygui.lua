local ffi = require('ffi')

-- Load the raygui shared library (adjust the path as needed)
local lib = ffi.load('libraygui')

ffi.cdef[[
// Core raygui functions
void GuiEnable(void);
void GuiDisable(void);
void GuiLock(void);
void GuiUnlock(void);
bool GuiIsLocked(void);
void GuiSetAlpha(float alpha);
void GuiSetState(int state);
int GuiGetState(void);

void GuiSetFont(Font font);
int GuiGetFont(void);

void GuiSetStyle(int control, int property, int value);
int GuiGetStyle(int control, int property);

void GuiLoadStyle(const char *fileName);
void GuiLoadStyleDefault(void);

void GuiEnableTooltip(void);
void GuiDisableTooltip(void);
void GuiSetTooltip(const char *tooltip);

const char *GuiIconText(int iconId, const char *text);
void GuiSetIconScale(int scale);
unsigned int GuiGetIcons(void);
const char *GuiLoadIcons(const char *fileName, bool loadIconsName);
void GuiDrawIcon(int iconId, int posX, int posY, int pixelSize, Color color);
int GuiGetTextWidth(const char *text);

// Controls
int GuiWindowBox(Rectangle bounds, const char *title);
int GuiGroupBox(Rectangle bounds, const char *text);
int GuiLine(Rectangle bounds, const char *text);
int GuiPanel(Rectangle bounds, const char *text);
int GuiLabel(Rectangle bounds, const char *text);
int GuiButton(Rectangle bounds, const char *text);
int GuiLabelButton(Rectangle bounds, const char *text);
int GuiToggle(Rectangle bounds, const char *text, bool active);
int GuiCheckBox(Rectangle bounds, const char *text, bool checked);
int GuiComboBox(Rectangle bounds, const char *text, int active);
int GuiDropdownBox(Rectangle bounds, const char *text, int *active, bool editMode);
int GuiSpinner(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, bool editMode);
int GuiValueBox(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, bool editMode);
int GuiTextBox(Rectangle bounds, char *text, int textSize, bool editMode);
int GuiSlider(Rectangle bounds, const char *textLeft, const char *textRight, float *value, float minValue, float maxValue);
int GuiProgressBar(Rectangle bounds, const char *textLeft, const char *textRight, float value, float minValue, float maxValue);
int GuiMessageBox(Rectangle bounds, const char *title, const char *message, const char *buttons);
// ... (add more as needed)
]]


local M = {}

setmetatable(M, { __index = lib })

return M
