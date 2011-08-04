#include "RGB.h"

RGB::RGB(unsigned char r, unsigned char g, unsigned char b)
: m_r(r)
, m_g(g)
, m_b(b)
{}

RGB::RGB(unsigned long val)
: m_r(val >> 16)
, m_g(val >> 8 & 0xFF)
, m_b(val & 0xFF)
{}
