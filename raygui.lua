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
int GuiTabBar(Rectangle bounds, const char *text, int count, int *active);
int GuiScrollPanel(Rectangle bounds, const char *text, Rectangle content, Vector2 *scroll, Rectangle *view);
int GuiLabel(Rectangle bounds, const char *text);
int GuiButton(Rectangle bounds, const char *text);
int GuiLabelButton(Rectangle bounds, const char *text);
int GuiToggle(Rectangle bounds, const char *text, bool active);
int GuiToggleGroup(Rectangle bounds, const char *text, int active);
int GuiToggleSlider(Rectangle bounds, const char *text, int active);
int GuiCheckBox(Rectangle bounds, const char *text, bool checked);
int GuiComboBox(Rectangle bounds, const char *text, int active);
int GuiDropdownBox(Rectangle bounds, const char *text, int *active, bool editMode);
int GuiSpinner(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, bool editMode);
int GuiValueBox(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, bool editMode);
int GuiValueBoxFloat(Rectangle bounds, const char *text, const char *textValue, float *value, bool editMode);
int GuiTextBox(Rectangle bounds, char *text, int textSize, bool editMode);
int GuiSlider(Rectangle bounds, const char *textLeft, const char *textRight, float *value, float minValue, float maxValue);
int GuiSliderBar(Rectangle bounds, const char *textLeft, const char *textRight, float *value, float minValue, float maxValue);
int GuiProgressBar(Rectangle bounds, const char *textLeft, const char *textRight, float value, float minValue, float maxValue);
int GuiStatusBar(Rectangle bounds, const char *text);
int GuiDummyRec(Rectangle bounds, const char *text);
int GuiGrid(Rectangle bounds, const char *text, float spacing, int subdivs, Vector2 mouseCell);
int GuiListView(Rectangle bounds, const char *text, int scrollIndex, int active);
int GuiListViewEx(Rectangle bounds, const char *text, int count, int scrollIndex, int active, int focus);
int GuiMessageBox(Rectangle bounds, const char *title, const char *message, const char *buttons);
int GuiTextInputBox(Rectangle bounds, const char *title, const char *message, const char *buttons, char *text, int textMaxSize, bool secretViewActive);
int GuiColorPicker(Rectangle bounds, const char *text, Color color);
int GuiColorPanel(Rectangle bounds, const char *text, Color color);
int GuiColorBarAlpha(Rectangle bounds, const char *text, float alpha);
int GuiColorBarHue(Rectangle bounds, const char *text, float value);
int GuiColorPickerHSV(Rectangle bounds, const char *text, Vector3 colorHSV);
int GuiColorPanelHSV(Rectangle bounds, const char *text, Vector3 colorHSV);

Vector2 GetMousePosition(void);
float GetMouseWheelMove(void);
bool IsMouseButtonDown(int button);
bool IsMouseButtonPressed(int button);
bool IsMouseButtonReleased(int button);
bool IsKeyDown(int key);
bool IsKeyPressed(int key);
int GetCharPressed(void);
void DrawRectangle(int x, int y, int width, int height, Color color);
void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);
Font GetFontDefault(void);
Font LoadFontEx(const char *fileName, int fontSize, int *codepoints, int codepointCount);
Texture2D LoadTextureFromImage(Image image);
void SetShapesTexture(Texture2D tex, Rectangle rec);
char *LoadFileText(const char *fileName);
void UnloadFileText(char *text);
const char *GetDirectoryPath(const char *filePath);
int *LoadCodepoints(const char *text, int *count);
void UnloadCodepoints(int *codepoints);
unsigned char *DecompressData(const unsigned char *compData, int compDataSize, int *dataSize);
Color GetColor(int hexValue);
int ColorToInt(Color color);
bool CheckCollisionPointRec(Vector2 point, Rectangle rec);
const char *TextFormat(const char *text, ...);
const char **TextSplit(const char *text, const char *delimiter, int *count);
int TextToInteger(const char *text);
float TextToFloat(const char *text);
int GetCodepointNext(const char *text, int *codepointSize);
const char *CodepointToUTF8(int codepoint, int *bytesize);
void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2);
]]

local M = {}

setmetatable(M, { __index = lib })

return M
