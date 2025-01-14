#pragma once

#include <Graphics/Object.h>
#include <Graphics/AbstractDisplay.h>

using DisplayCallback = Delegate<void(Graphics::AbstractDisplay&)>;

bool initDisplay(DisplayCallback onDisplay);

Graphics::AbstractDisplay* getDisplay();
